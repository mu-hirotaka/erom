class AddVisibleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visible, :integer
  end
end
