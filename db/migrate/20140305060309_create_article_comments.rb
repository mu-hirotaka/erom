class CreateArticleComments < ActiveRecord::Migration
  def change
    create_table :article_comments do |t|
      t.string  :comment
      t.integer :article_id
      t.timestamps
    end
  end
end
