# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

CSV.foreach('db/article.csv') do |row|
  Article.create(:title => row[0], :comment => row[1], :url => row[2], :total_point => 0, :today_point => 0, :visible => 1)
end

CSV.foreach('db/article_comment.csv') do |row|
  ArticleComment.create(:article_id => row[0], :comment => row[1], :elapsed_time => row[2])
end
