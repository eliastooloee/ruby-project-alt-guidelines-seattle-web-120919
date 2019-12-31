class CreateStarships < ActiveRecord::Migration[5.2]
  def change
    create_table :starships do |t|
      t.string :name
      t.integer :crew
      t.float :mass
      t.float :thrust
    end
  end
end
