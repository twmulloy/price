class CreateMvsGames < ActiveRecord::Migration
  def change
    create_table :mvs_games do |t|
      t.integer :year
      t.integer :ngh
      t.string :developer
      t.string :series
      t.string :title_english
      t.string :title_romaji
      t.string :title_katakana
      t.integer :meg

      t.timestamps
    end
  end
end
