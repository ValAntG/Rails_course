class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.string :type_car
      t.integer :place_top
      t.integer :place_botton
      t.integer :train_id

      t.timestamps
    end
  end
end
