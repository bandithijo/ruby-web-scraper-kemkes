# Ruby Web Scraper (Studi Kasus: KemKes)

Ruby script untuk melakukan pencatatan data perhari berkenaan tentang "**Situasi COVID-19**" pada website [KemKes](https://kemkes.go.id/).

## Prerequisite

| <center>No.</center> | <center>Gem</center> | <center>Version</center> |
| :--: | :--- | :--: |
| 1 | [**Ruby**](https://www.ruby-lang.org/en/) | `2.7.1` |
| 2 | [**PostgreSQL**](https://www.postgresql.org/) | `12.3` |
| 3 | [**HTTParty**](https://rubygems.org/gems/httparty) | `0.18.1` |
| 4 | [**Nokogiri**](https://rubygems.org/gems/nokogiri) | `1.10.9` |
| 5 | [**ActiveRecord**](https://rubygems.org/gems/activerecord) | `6.0.3` |
| 6 | [**Standalone_Migrations**](https://rubygems.org/gems/standalone_migrations) | `6.0.0` |
| 7 | [**pg**](https://rubygems.org/gems/pg) | `1.2.3` |
| 8 | [**whenever**](https://rubygems/gems/whenever) | `1.0` |

## Menjalankan Script

```shell
$ rake run
```

## Mereset Data Tabel

```shell
$ rake db:reset
```

## Automatic Scraping

Saya menambahkan fungsi penjadwalan proses *scraping* dengan bantuan **whenever** gem.

Untuk mengaktifkan dan membuatnya berjalan pada saat sistem dinyalakan.

Aktifkan **cronie** service.

```shell
$ sudo systemctl enable --now cronie.service
```

Lalu, daftarkan penjadwalan ke **crontab**.

```shell
$ whenever --update-crontab
```

Secara *default* saya menjadwalkan *script* ini akan melakukan *scraping* setiap hari pada jam 05.00 PM.

Hal-hal yang perlu dipastikan akan proses automatisasi berjalan dengan baik.

1. PostgreSQL service sudah berjalan
2. Cronie service sudah berjalan
