class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :railway_stations_routes do |t|
      t.integer :route_id
      t.integer :railway_station_id
      t.integer :position, null: false
      t.integer :train_id
      t.time :arrival
      t.time :departure

      t.timestamps
    end
  end
end
