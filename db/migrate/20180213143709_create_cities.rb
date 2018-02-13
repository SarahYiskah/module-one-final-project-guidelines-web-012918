class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.float :distance
    end
  end
end
