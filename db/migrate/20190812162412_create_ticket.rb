class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :train_id
      t.integer :railway_station_first_id
      t.integer :railway_station_last_id
      t.integer :user_id
    end
  end
end