class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.float :radius
      t.float :mass
      t.float :atmospheric_pressure
      t.boolean :inhabited
    end
  end
end
