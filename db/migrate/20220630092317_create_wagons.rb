class CreateWagons < ActiveRecord::Migration[7.0]
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :wagon_type
      t.integer :top_places
      t.integer :lower_places
      t.integer :train_id

      t.timestamps
    end
  end
end
