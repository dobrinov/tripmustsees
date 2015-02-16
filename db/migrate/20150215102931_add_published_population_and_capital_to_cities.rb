class AddPublishedPopulationAndCapitalToCities < ActiveRecord::Migration
  def change
    add_column :cities, :published, :boolean, default: false
    add_column :cities, :capital, :boolean, default: false
    add_column :cities, :population, :integer
  end
end
