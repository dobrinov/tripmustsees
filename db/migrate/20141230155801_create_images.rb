class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.integer :imageable_id
      t.string  :imageable_type
      t.integer :priority

      t.timestamps
    end

    add_index :images, :imageable_id
  end
end
