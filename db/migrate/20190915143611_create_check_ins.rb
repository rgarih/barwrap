class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.references :user, foreign_key: true
      t.text :comment
      t.string :type_of_music
      t.string :photo
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
