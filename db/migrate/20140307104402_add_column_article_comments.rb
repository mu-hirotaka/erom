class AddColumnArticleComments < ActiveRecord::Migration
  def change
    add_column :article_comments, :elapsed_time, :integer
  end
end
