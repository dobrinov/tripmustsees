class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :default_zoom_level

      t.timestamps
    end
  end
end
