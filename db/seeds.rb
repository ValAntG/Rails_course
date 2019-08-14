RailwayStation.create([{ title: 'Kiev' }, { title: 'Kharkov' }, { title: 'Poltava' }])
Route.create([{ name: 'Kiev-Kharkov' }, { name: 'Kharkov-Kiev' }])
Train.create([{ name: '63', current_station_id: 1, route_id: 1 }, { name: '64', current_station_id: 2, route_id: 2 }])
Carriage.create([{ type_car: "econom", place_top: 26, place_botton: 26, train_id: 1 },
                { type_car: "econom", place_top: 26, place_botton: 26, train_id: 1 },
                { type_car: "coupe", place_top: 18, place_botton: 18, train_id: 1 }])
User.create([{ name: 'Valentyn' }, { name: 'Dmitriy' }])
Ticket.create([{ train_id: 1, railway_station_first_id: 1, railway_station_last_id: 2, user_id: 1 },
              { train_id: 2, railway_station_first_id: 1, railway_station_last_id: 2, user_id: 2 },
              { train_id: 3, railway_station_first_id: 2, railway_station_last_id: 1, user_id: 1 }])


