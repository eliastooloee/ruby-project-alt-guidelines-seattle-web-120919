class CreateLandings < ActiveRecord::Migration[5.2]
  def change
    create_table :landings do  |t|
      t.integer :starship_id
      t.integer :planet_id
    end
  end
end
