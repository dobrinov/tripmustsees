class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :type
      t.integer :city_id
      t.integer :sight_seeing_category_id

      t.timestamps
    end
  end
end
