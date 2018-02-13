class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :country
      t.string :name
      t.float :lat
      t.float :lng
      t.float :distance
    end
  end
end
