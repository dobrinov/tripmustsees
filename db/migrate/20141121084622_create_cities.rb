class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :country_id
      t.float :latitude
      t.float :longitude
      t.integer :default_zoom_level

      t.timestamps
    end
  end
end
