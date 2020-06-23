require_relative '../app/models/covid_kemkes_pasien'

data = CovidKemkesPasien.create(
  positif_covid:   43803,
  sembuh_covid:    17349,
  meninggal_covid: 2373,
  jumlah_odp:      36464,
  jumlah_pdp:      13211,
  fetched_at:      '2020-06-19'
)
puts "Insert data => #{data.fetched_at}"

data = CovidKemkesPasien.create(
  positif_covid:   45029,
  sembuh_covid:    17883,
  meninggal_covid: 2429,
  jumlah_odp:      37336,
  jumlah_pdp:      13150,
  fetched_at:      '2020-06-20'
)
puts "Insert data => #{data.fetched_at}"

data = CovidKemkesPasien.create(
  positif_covid:   45891,
  sembuh_covid:    18404,
  meninggal_covid: 2465,
  jumlah_odp:      56436,
  jumlah_pdp:      13225,
  fetched_at:      '2020-06-21'
)
puts "Insert data => #{data.fetched_at}"

data = CovidKemkesPasien.create(
  positif_covid:   46845,
  sembuh_covid:    18735,
  meninggal_covid: 2500,
  jumlah_odp:      43500,
  jumlah_pdp:      12999,
  fetched_at:      '2020-06-22'
)
puts "Insert data => #{data.fetched_at}"

data = CovidKemkesPasien.create(
  positif_covid:   47896,
  sembuh_covid:    19241,
  meninggal_covid: 2535,
  jumlah_odp:      35983,
  jumlah_pdp:      13348,
  fetched_at:      '2020-06-23'
)
puts "Insert data => #{data.fetched_at}"
