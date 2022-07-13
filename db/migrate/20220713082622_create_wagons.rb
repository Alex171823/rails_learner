class CreateWagons < ActiveRecord::Migration[5.2]
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :type

      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :sitting_seats

      t.belongs_to :train
      t.integer :index_number

      t.timestamps
    end
  end
end
