class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title
      t.integer :total_point
      t.integer :today_point
      t.timestamps
    end
  end
end
