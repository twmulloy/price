class MvsGame < ActiveRecord::Base

  has_many :mvs_auctions
  
  attr_accessible :developer, :meg, :ngh, :series, :title_english, :title_katakana, :title_romaji, :year
end
