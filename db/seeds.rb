# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# seed mvs_games
CSV_FILE_PATH = File.join(File.dirname(__FILE__), "seeds/mvs_games.csv")

ActiveRecord::Base.connection.execute("TRUNCATE TABLE mvs_games;")
ActiveRecord::Base.connection.reset_pk_sequence!('mvs_games')

CSV.foreach(CSV_FILE_PATH, :headers => true) do |row|
  MvsGame.create!(row.to_hash)
end

