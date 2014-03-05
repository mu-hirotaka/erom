class ArticleComment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :article
end
