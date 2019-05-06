class AddCarthumbToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :car_thumb, :string
  end
end
