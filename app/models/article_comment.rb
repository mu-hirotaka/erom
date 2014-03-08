class ArticleComment < ActiveRecord::Base
  attr_accessible :comment, :article_id, :elapsed_time
  belongs_to :article
end
