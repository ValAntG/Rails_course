class AddRailwayStationToTrain < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :trains, :railway_station
  end
end
