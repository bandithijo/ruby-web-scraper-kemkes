# Ruby Web Scraper (Studi Kasus: KemKes)

Ruby script untuk melakukan pencatatan data perhari berkenaan tentang "**Situasi COVID-19**" pada website [KemKes](https://kemkes.go.id/).

## Prerequisite

| <center>No.</center> | <center>Gem</center> | <center>Version</center> |
| :--: | :--- | :--: |
| 1 | [**Ruby**](https://www.ruby-lang.org/en/) | `2.6.3` |
| 2 | [**PostgreSQL**](https://www.postgresql.org/) | `12.3` |
| 3 | [**HTTParty**](https://rubygems.org/gems/httparty) | `0.18.1` |
| 4 | [**Nokogiri**](https://rubygems.org/gems/nokogiri) | `1.10` |
| 5 | [**ActiveRecord**](https://rubygems.org/gems/activerecord) | `6.0` |
| 6 | [**Standalone_Migrations**](https://rubygems.org/gems/standalone_migrations) | `6.0` |
| 7 | [**pg**](https://rubygems.org/gems/pg) | `1.2` |

## Inisialisasi Awal

```shell
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

## Memparsing Data

```shell
$ rake run
```

## Mereset Data Tabel

```shell
$ rake db:reset
```
