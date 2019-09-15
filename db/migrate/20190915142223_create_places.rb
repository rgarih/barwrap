class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :place_type
      t.string :photo
      t.integer :age_group

      t.timestamps
    end
  end
end
