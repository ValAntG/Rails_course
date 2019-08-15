station1 = RailwayStation.create({ title: 'Kiev' })
station2 = RailwayStation.create({ title: 'Kharkov' })
station3 = RailwayStation.create({ title: 'Poltava' })

route1 = Route.create({ name: 'Kiev-Kharkov' })
route2 = Route.create({ name: 'Kharkov-Kiev' })

train1 = Train.create({ name: '63', current_station: station1, route: route1, sortcar: true })
train2 = Train.create({ name: '64', current_station: station2, route: route2, sortcar: true })

carriage1 = Carriage.create({ type: "CoupeCarriage", number: 1, place_top: 26, place_botton: 26, train: train1 })
carriage2 = Carriage.create({ type: "EconomCarriage", number: 2, place_top: 18, place_botton: 18, place_top_side: 9,
                              place_botton_side: 9, train: train1 })
carriage3 = Carriage.create({ type: "ExpressCarriage", number: 3, seat: 60, train: train1 })
carriage4 = Carriage.create({ type: "ExpressCarriage", number: 4, seat: 60, train: train1 })
carriage5 = Carriage.create({ type: "VipCarriage", number: 5, place_botton: 18, train: train1 })

user1 = User.create({ name: 'Valentyn' })
user2 = User.create({ name: 'Dmitriy' })

ticket1 = Ticket.create({ train: train1, railway_station_first: station2, railway_station_last: station1, user: user1 })
ticket2 = Ticket.create({ train: train1, railway_station_first: station2, railway_station_last: station1, user: user2 })
ticket3 = Ticket.create({ train: train2, railway_station_first: station1, railway_station_last: station2, user: user1 })
