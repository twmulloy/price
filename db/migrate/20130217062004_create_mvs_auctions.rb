class CreateMvsAuctions < ActiveRecord::Migration
  def change
    create_table :mvs_auctions do |t|
      t.integer :mvs_game_id
      t.string :title
      t.string :url
      t.string :thumb
      t.datetime :auction_end
      t.datetime :ended_at
      t.decimal :price
      t.boolean :approved, :default => true

      t.timestamps
    end

    add_column :mvs_auctions, :item_id, :bigint
    add_index :mvs_auctions, [:mvs_game_id, :item_id]
  end
end
