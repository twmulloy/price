class MvsAuctionsController < ApplicationController
  # GET /mvs_auctions
  # GET /mvs_auctions.json
  def index
    @mvs_auctions = MvsAuction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mvs_auctions }
    end
  end

  # GET /mvs_auctions/1
  # GET /mvs_auctions/1.json
  def show
    @mvs_auction = MvsAuction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mvs_auction }
    end
  end

  # GET /mvs_auctions/new
  # GET /mvs_auctions/new.json
  def new
    @mvs_auction = MvsAuction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mvs_auction }
    end
  end

  # GET /mvs_auctions/1/edit
  def edit
    @mvs_auction = MvsAuction.find(params[:id])
  end

  # POST /mvs_auctions
  # POST /mvs_auctions.json
  def create
    @mvs_auction = MvsAuction.new(params[:mvs_auction])

    respond_to do |format|
      if @mvs_auction.save
        format.html { redirect_to @mvs_auction, notice: 'Mvs auction was successfully created.' }
        format.json { render json: @mvs_auction, status: :created, location: @mvs_auction }
      else
        format.html { render action: "new" }
        format.json { render json: @mvs_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mvs_auctions/1
  # PUT /mvs_auctions/1.json
  def update
    @mvs_auction = MvsAuction.find(params[:id])

    respond_to do |format|
      if @mvs_auction.update_attributes(params[:mvs_auction])
        format.html { redirect_to @mvs_auction, notice: 'Mvs auction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mvs_auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mvs_auctions/1
  # DELETE /mvs_auctions/1.json
  def destroy
    @mvs_auction = MvsAuction.find(params[:id])
    @mvs_auction.destroy

    respond_to do |format|
      format.html { redirect_to mvs_auctions_url }
      format.json { head :no_content }
    end
  end
end
