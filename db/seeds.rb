station1 = RailwayStation.create(title: 'Kiev')
station2 = RailwayStation.create(title: 'Poltava')
RailwayStation.create(title: 'Kharkov')

route1 = Route.create(name: 'Kiev-Kharkov')
route2 = Route.create(name: 'Kharkov-Kiev')

train1 = Train.create(name: '63', current_station: station1, route: route1, sortcar: true)
Train.create(name: '64', current_station: station2, route: route2, sortcar: true)

RailwayStationsRoute.create(railway_station_id: 1, route_id: 1, position: 1, arrival: '00:00', departure: '23:16')
RailwayStationsRoute.create(railway_station_id: 2, route_id: 1, position: 2, arrival: '01:28', departure: '01:48')
RailwayStationsRoute.create(railway_station_id: 3, route_id: 1, position: 3, arrival: '06:14', departure: '00:00')
RailwayStationsRoute.create(railway_station_id: 1, route_id: 2, position: 3, arrival: '05:57', departure: '00:00')
RailwayStationsRoute.create(railway_station_id: 2, route_id: 2, position: 2, arrival: '03:18', departure: '03:38')
RailwayStationsRoute.create(railway_station_id: 3, route_id: 2, position: 1, arrival: '00:00', departure: '23:05')

Carriage.create(type: 'CoupeCarriage', number: 1, place_top: 26, place_botton: 26, train: train1)
Carriage.create(type: 'EconomCarriage', number: 2, place_top: 18, place_botton: 18, place_top_side: 9,
                place_botton_side: 9, train: train1)
Carriage.create(type: 'ExpressCarriage', number: 3, seat: 60, train: train1)
Carriage.create(type: 'ExpressCarriage', number: 4, seat: 60, train: train1)
Carriage.create(type: 'VipCarriage', number: 5, place_botton: 18, train: train1)
