class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :round_id
      t.string :name
      t.integer :point

      t.timestamps
    end
  end
end
