require 'httparty'
require 'nokogiri'
require 'byebug'
require 'active_record'
require_relative './models/covid_kemkes_pasien'
require_relative './helpers/color_helper'
require 'date'

def db_configuration
  db_configuration_file = File.join(File.expand_path('..', __FILE__), '..', 'db', 'config.yml')
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration['development'])

def scraper
  begin
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
  rescue Exception => e
    puts "ERROR: #{e.message}"
    exit
  end

  data_input = CovidKemkesPasien.new(
    positif_covid:   data[:positif_covid],
    sembuh_covid:    data[:sembuh_covid],
    meninggal_covid: data[:meninggal_covid],
    jumlah_odp:      data[:jumlah_odp],
    jumlah_pdp:      data[:jumlah_pdp],
    fetched_at:      DateTime.now.localtime
  )

  data_local = CovidKemkesPasien.all.last
  # byebug

  if data_input.valid?
    if (data_input.fetched_at.localtime.to_date != data_local.fetched_at.localtime.to_date) &&
           (data_input.positif_covid != data_local.positif_covid)
      data_input.save
      puts "INFO: Data berhasil diinputkan ke dalam database!".bold.black.bg_brown
      puts "Total Pasien Positif (REMOTE): " + "#{data_input.positif_covid}".bold
      puts "Total Pasien Positif (LOCAL) : " + "#{data_local.positif_covid}".bold
      puts "Total Pasien Positif Baru    : " + "#{data_input.positif_covid - data_local.positif_covid}".bold
    else
      puts "INFO: Belum ada data baru untuk hari ini!".bold.black.bg_brown
      puts "Total Pasien Positif (REMOTE): " + "#{data_input.positif_covid}".bold \
                                             + " (#{data_input.fetched_at.localtime.to_date})"
      puts "Total Pasien Positif (LOCAL) : " + "#{data_local.positif_covid}".bold \
                                             + " (#{data_local.fetched_at.localtime.to_date})"
    end
  else
    puts "INFO: Data tidak valid!".bold.black.bg_red
    puts data_input.errors.messages
  end
end

scraper
