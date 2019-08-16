class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :place_top
      t.integer :place_botton
      t.integer :place_top_side
      t.integer :place_botton_side
      t.integer :seat
      t.integer :train_id
      t.string :type

      t.timestamps
    end
  end
end
