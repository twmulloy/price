class MvsAuction < ActiveRecord::Base

  belongs_to :mvs_game

  attr_accessible :approved, :auction_end, :ended_at, :item_id, :large, :medium, :mvs_game_id, :price, :small, :title, :url
end
