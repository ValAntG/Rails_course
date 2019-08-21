class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :train_id, null: false
      t.string :last_name
      t.string :first_name
      t.string :father_name
      t.string :passport_series
      t.integer :passport_numbers
      t.integer :railway_station_first_id
      t.integer :railway_station_last_id
      t.integer :user_id

      t.timestamps
    end
  end
end
