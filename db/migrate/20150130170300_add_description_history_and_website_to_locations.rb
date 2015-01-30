class AddDescriptionHistoryAndWebsiteToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :description, :text
    add_column :locations, :history, :text
    add_column :locations, :website, :string
  end
end
