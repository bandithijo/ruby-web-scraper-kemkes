
# INSERT INTO covid_kemkes_pasiens VALUES(1, 43803, 17349, 2373, 36464, 13211, '2020-06-19 23:24:34.251703');
# INSERT INTO covid_kemkes_pasiens VALUES(2, 45029, 17883, 2429, 37336, 13150, '2020-06-20 12:38:19.914417');

require_relative '../app/models/covid_kemkes_pasien'

CovidKemkesPasien.create(
  positif_covid: 43803,
  sembuh_covid: 17349,
  meninggal_covid: 2373,
  jumlah_odp: 36464,
  jumlah_pdp: 13211,
  fetched_at: '2020-06-19 23:24:34.251703'
)

CovidKemkesPasien.create(
  positif_covid: 45029,
  sembuh_covid: 17883,
  meninggal_covid: 2429,
  jumlah_odp: 37336,
  jumlah_pdp: 13150,
  fetched_at: '2020-06-20 12:38:19.914417'
)
