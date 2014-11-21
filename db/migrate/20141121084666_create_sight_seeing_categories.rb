class CreateSightSeeingCategories < ActiveRecord::Migration
  def change
    create_table :sight_seeing_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
