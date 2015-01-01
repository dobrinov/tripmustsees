class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :slug
      t.string :type
      t.integer :city_id
      t.integer :location_category_id
      t.float :latitude
      t.float :longitude
      t.integer :default_zoom_level

      t.timestamps
    end
  end
end
