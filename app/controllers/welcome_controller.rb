class WelcomeController < ApplicationController
  def index
    @list = Ebay.new.get_sold_listing
  end
end
