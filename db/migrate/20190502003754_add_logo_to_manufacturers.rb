class AddLogoToManufacturers < ActiveRecord::Migration[5.2]
  def change
    add_column :manufacturers, :logo_url, :string
  end
end
