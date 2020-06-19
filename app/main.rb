require 'httparty'
require 'nokogiri'
require 'byebug'
require 'active_record'
require_relative './models/covid_kemkes_pasien'
require 'date'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration['development'])

def scraper
  target_url     = "https://kemkes.go.id/"
  unparsed_page  = HTTParty.get(target_url)
  parsed_page    = Nokogiri::HTML(unparsed_page)

  data = {
    positif_covid:   parsed_page.css("td")[2].text.gsub(".", "").to_i,
    sembuh_covid:    parsed_page.css("td")[5].text.gsub(".", "").to_i,
    meninggal_covid: parsed_page.css("td")[8].text.gsub(".", "").to_i,
    jumlah_odp:      parsed_page.css("td")[11].text.gsub(".", "").to_i,
    jumlah_pdp:      parsed_page.css("td")[14].text.gsub(".", "").to_i,
  }

  data_input = CovidKemkesPasien.new(
    positif_covid:   data[:positif_covid],
    sembuh_covid:    data[:sembuh_covid],
    meninggal_covid: data[:meninggal_covid],
    jumlah_odp:      data[:jumlah_odp],
    jumlah_pdp:      data[:jumlah_pdp],
    fetched_at:      DateTime.now
  )
  byebug

  if data_input.valid?
    unless data_input.created_at.to_date == CovidKemkesPasien.all.last.created_at.to_date
      data_input.save
      puts "INFO: Data berhasil diinputkan ke dalam database!"
    else
      puts "INFO: Tidak ada data baru untuk hari ini!"
    end
  else
    puts "INFO: Data tidak valid!"
    puts data_input.errors.messages
  end
end

scraper
