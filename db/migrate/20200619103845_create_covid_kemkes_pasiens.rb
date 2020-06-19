class CreateCovidKemkesPasiens < ActiveRecord::Migration[6.0]
  def change
    create_table :covid_kemkes_pasiens do |t|
      t.integer  :positif_covid
      t.integer  :sembuh_covid
      t.integer  :meninggal_covid
      t.integer  :jumlah_odp
      t.integer  :jumlah_pdp
      t.datetime :fetched_at
    end
  end
end
