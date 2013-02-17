class MvsAuction < ActiveRecord::Base

  belongs_to :mvs_game

  attr_accessible :approved, :auction_end, :ended_at, :item_id, :thumb, :mvs_game_id, :price, :title, :url
end
