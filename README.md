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

## owner テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| firstname | string | null: false |
| lastname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

## users テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| firstname        | string     | null: false                    |
| lastname         | string     | null: false                    |
| firstname_kana   | string     | null: false                    |
| lastname_kana    | string     | null: false                    |
| email            | string     | null: false                    |
| sex              | text       | null: false                    |
| birth_day        | date       | null: false                    |
| phone_number     | string     | null: false                    |


| postal_code      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
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
| q_year_1         | integer    |                                |
| q_year_2         | integer    |                                |
| q_year_3         | integer    |                                |
| station          | string     |                                |
| spouse           | text       | null: false                    |

## Association
  has_one: parttime

## parttimes テーブル
| user_id          | references | null: false, foreign_key: true |
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
| pr_1             | string     | null: false                    |
| pr_2             | string     | null: false                    |
| pr_2             | string     | null: false                    |

## Association
  belongs_to: user
