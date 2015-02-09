class AddGeneralInformationToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :general_information, :text
  end
end
