class CreateStarships < ActiveRecord::Migration[5.2]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :class
      t.integer :crew
      t.integer :mass
      t.float :thrust
    end
  end
end
