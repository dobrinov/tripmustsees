class AddGeneralInformationToCities < ActiveRecord::Migration
  def change
    add_column :cities, :general_information, :text
  end
end
