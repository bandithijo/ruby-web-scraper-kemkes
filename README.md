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

## Menjalankan Script

```shell
$ rake run
```

## Mereset Data Tabel

```shell
$ rake db:reset
```
