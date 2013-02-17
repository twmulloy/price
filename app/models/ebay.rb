class Ebay

  include EbayConfig
  include HTTParty



  # no initializer needed since credentials are passed with each request
  def initialize

  end

  def find_auctions_for_all_mvs_games

    games = MvsGame.all

    games.each do |game|
      find_auctions_for_mvs_game_by_id(game.id)
    end

    nil

  end

  def find_auctions_for_mvs_game_by_id mvs_game_id

    method = 'findItemsAdvanced'
    
    auctions = []

    game = MvsGame.find(mvs_game_id)

    # determine if game is part of a series and exclude other games in series
    query = "\"#{game.title_english}\" MVS (cart,cartridge) -(hyper,F3,AtomisWave,marquee,artwork,flyers,lot,box,case,hardshell,kit,stickers,games)"

    total_pages = 1
    limit = 100
    offset = 1

    params = {
      # payload
      'keywords' => query,
      'descriptionSearch' => true,

      # pagination
      'paginationInput.entriesPerPage' => limit,
      'paginationInput.pageNumber' => offset
    }
    
    response = send_request(method, params)

    return unless response['searchResult'].first.has_key?('item')

    # push first page to complete auctions listing
    auctions += response['searchResult'].first['item']

    pagination = get_pagination(response)

    # update pagination details
    total_pages = pagination[:total_pages]

    # more than a single page, get necessary variables to begin looping to retrieve
    if total_pages > 1
      begin  

        # since we have the first page already we can increment by 1 to the 2nd page
        offset += 1

        # modify params hash
        params['paginationInput.pageNumber'] = offset

        # get the current page data
        auctions += send_request(method, params)['searchResult'].first['item']
      end until offset >= total_pages
    end

    create_mvs_auctions(mvs_game_id, auctions)

    nil

  end

private

  # iterate through all auctions from ebay api and create MvsAuction models
  def create_mvs_auctions(mvs_game_id, auctions)
    
    auctions.each do |auction|

      mvs_auction = MvsAuction.find_or_initialize_by_item_id(auction['itemId'].first)

      # calculate price (of strings)
      price = auction['sellingStatus'].first['convertedCurrentPrice'].first['__value__'].to_f

      # factor in shipping (if applicable)
      price += auction['shippingInfo'].first['shippingServiceCost'].first['__value__'].to_f if auction['shippingInfo'].first.has_key?('shippingServiceCost')

      mvs_auction.update_attributes({
        mvs_game_id:  mvs_game_id,
        title:        auction['title'].first,
        url:          auction['viewItemURL'].first,
        thumb:        auction['galleryURL'].first,
        auction_end:  auction['listingInfo'].first['endTime'].first,
        price:        price
      })

    end

    nil

  end

  def send_request(method, params={})

    options = {
      :format => :json,
      :query => {
        # api header
        'OPERATION-NAME'        => method,
        'SERVICE-VERSION'       => ebay_config['api']['finding']['version'],
        'SECURITY-APPNAME'      => ebay_config['production']['app_id'],
        'RESPONSE-DATA-FORMAT'  => 'JSON',
        'REST-PAYLOAD'          => ''
      }
    }

    # merge in params
    options[:query].merge!(params)

    # send httparty request
    response = self.class.get(ebay_config['api']['finding']['base_uri'], options)

    return unless response.parsed_response.has_key?("#{method}Response")

    response.parsed_response["#{method}Response"].first
  end

  # retrieve only the pagination details
  def get_pagination(response)

    return unless response.has_key?('paginationOutput')

    return { :total_pages => 0 } unless response['paginationOutput'][0].has_key?('totalPages')
    
    # return relevant data
    { 
      :response       => response, 
      :total_pages    => response['paginationOutput'][0]['totalPages'][0].to_i,
      :total_items    => response['paginationOutput'][0]['totalEntries'][0].to_i,
      :offset         => response['paginationOutput'][0]['pageNumber'][0].to_i,
      :limit          => response['paginationOutput'][0]['entriesPerPage'][0].to_i
    }

  end


  
end