class Ebay

  include EbayConfig
  include HTTParty

  # no initializer needed since credentials are passed with each request
  def initialize

  end

  def get_sold_listing
    p get_sold_listing_pagination
  end

private

  # by default return the first page
  def get_sold_listing_page offset = 1, limit = 100
    options = {
      :format => :json,
      :query => {
        # api header
        'OPERATION-NAME'        => 'findCompletedItems',
        'SERVICE-VERSION'       => ebay_config['api']['finding']['version'],
        'SECURITY-APPNAME'      => ebay_config['production']['app_id'],
        'RESPONSE-DATA-FORMAT'  => 'JSON',
        'REST-PAYLOAD'          => '',

        # payload
        'keywords' => "neo geo mvs",
        'itemFilter(0).name' => 'SoldItemsOnly',
        'itemFilter(0).value' => true,
        'paginationInput.entriesPerPage' => 100, # max 100 allowed by api
        'sortOrder' => 'PricePlusShippingLowest',

        # pagination
        'paginationInput.entriesPerPage' => limit,
        'paginationInput.pageNumber' => offset
      }
    }
    
    # send httparty request
    response = self.class.get(ebay_config['api']['finding']['base_uri'], options)

    return unless response.parsed_response.has_key?('findCompletedItemsResponse')

    response.parsed_response['findCompletedItemsResponse'].first
  end

  # retrieve only the pagination details
  def get_sold_listing_pagination

    response = get_sold_listing_page

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