station1 = RailwayStation.create(title: 'Kiev')
station2 = RailwayStation.create(title: 'Poltava')
station3 = RailwayStation.create(title: 'Kharkov')

route1 = Route.create(name: 'Kiev-Kharkov')
route2 = Route.create(name: 'Kharkov-Kiev')

train1 = Train.create(name: '63', current_station: station1, route: route1, sortcar: true)
train2 = Train.create(name: '64', current_station: station2, route: route2, sortcar: true)

rsr1 = RailwayStationsRoute.create(railway_station_id: 1, route_id: 1, train_id: 1, position: 1, arrival: '00:00',
                                  departure: '23:16')
rsr2 = RailwayStationsRoute.create(railway_station_id: 2, route_id: 1, train_id: 1, position: 2, arrival: '01:28',
                                  departure: '01:48')
rsr3 = RailwayStationsRoute.create(railway_station_id: 3, route_id: 1, train_id: 1, position: 3, arrival: '06:14',
                                  departure: '00:00')
rsr4 = RailwayStationsRoute.create(railway_station_id: 1, route_id: 2, train_id: 2, position: 3, arrival: '05:57',
                                  departure: '00:00')
rsr5 = RailwayStationsRoute.create(railway_station_id: 2, route_id: 2, train_id: 2, position: 2, arrival: '03:18',
                                  departure: '03:38')
rsr6 = RailwayStationsRoute.create(railway_station_id: 3, route_id: 2, train_id: 2, position: 1, arrival: '00:00',
                                  departure: '23:05')

carriage1 = Carriage.create(type: "CoupeCarriage", number: 1, place_top: 26, place_botton: 26, train: train1)
carriage2 = Carriage.create(type: "EconomCarriage", number: 2, place_top: 18, place_botton: 18, place_top_side: 9,
                              place_botton_side: 9, train: train1)
carriage3 = Carriage.create(type: "ExpressCarriage", number: 3, seat: 60, train: train1)
carriage4 = Carriage.create(type: "ExpressCarriage", number: 4, seat: 60, train: train1)
carriage5 = Carriage.create(type: "VipCarriage", number: 5, place_botton: 18, train: train1)

user1 = User.create(name: 'Valentyn')
user2 = User.create(name: 'Dmitriy')

ticket1 = Ticket.create(last_name: 'Гринь', first_name: 'Дмитрий', passport_series: 'МК', passport_numbers: 325_368,
                          rsr_first: rsr1, rsr_last: rsr3, user: user1)
ticket2 = Ticket.create(last_name: 'Геврасёв', first_name: 'Валентин', passport_series: 'МН', passport_numbers: 723_368,
                          rsr_first: rsr1, rsr_last: rsr3, user: user2)
ticket3 = Ticket.create(last_name: 'Гринь', first_name: 'Дмитрий', passport_series: 'МК', passport_numbers: 325_368,
                          rsr_first: rsr6, rsr_last: rsr5, user: user1)
