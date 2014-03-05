class Article < ActiveRecord::Base
  attr_accessible :title, :comment, :today_point, :total_point, :url, :visible
  has_many :article_comments
end
