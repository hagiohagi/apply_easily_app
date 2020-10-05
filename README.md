# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


#テーブル

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| firstname | string | null: false |
| lastname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association
has_one :information

## admin テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| firstname | string | null: false |
| lastname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

## informations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| firstname        | references | null: false, foreign_key: true |
| lastname         | references | null: false, foreign_key: true |
| email            | references | null: false, foreign_key: true |
| firstname_kana   | string     | null: false                    |
| lastname_kana    | string     | null: false                    |
| sex              | boolean    | null: false                    |
| birth_year       | integer    | null: false                    |
| birth_month      | integer    | null: false                    |
| birth_day        | integer    | null: false                    |
| phone_number     | integer    | null: false                    |
| image            | string     | null: false                    |
| postal_code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| building         | string     |                                |
| highschool       | string     | null: false                    |
| h_admission      | integer    | null: false                    |
| h_graduate       | integer    | null: false                    |
| univercity       | string     |                                |
| u_admission      | string     |                                |
| u_graduate       | string     |                                |
| job_experience   | text       |                                |
| qualification_1  | string     |                                |
| qualification_2  | string     |                                |
| qualification_3  | string     |                                |
| q_year_1         | string     |                                |
| q_year_2         | string     |                                |
| q_year_3         | string     |                                |
| station          | string     |                                |
| spouse           | boolean    | null: false                    |
| uniform_size     | integer    | null:false                     |
| shoes_size       | integer    | null:false                     |
| sun_parttime_in  | integer    |                                |
| sun_parttime_out | integer    |                                |
| mon_parttime_in  | integer    |                                |
| mon_parttime_out | integer    |                                |
| tue_parttime_in  | integer    |                                |
| tue_parttime_out | integer    |                                |
| wed_parttime_in  | integer    |                                |
| wed_parttime_out | integer    |                                |
| thu_parttime_in  | integer    |                                |
| thu_parttime_out | integer    |                                |
| fry_parttime_in  | integer    |                                |
| fry_parttime_out | integer    |                                |
| sat_parttime_in  | integer    |                                |
| sat_parttime_out | integer    |                                | 
| pr_1             | string     |                                |
| pr_2             | string     |                                |
| pr_2             | string     |                                |

### Association
belongs_to :user