# README

# アプリケーション名  
かんたん履歴書登録(apply_easily_app)  

# 概要  
個人経営の店舗を想定して、アルバイト募集を効率化することを目的に作成しました。  
紙媒体の履歴書のデータをweb入力できるようにすることで、  
応募者が書類を書く手間を省いたり、採用者が応募者のデータを管理できやすくなると考えました。  
  
機能としては、  
・応募に必要な情報を記入して登録する。  
・管理者用アカウントでログインし、登録されたデータを閲覧する。  
この2つに大きく分けられます。  
  
また、昨今の転職サイトで「ユーザー登録→企業ごとにエントリーする」という手順が多かったので、  
応募の手順を、まずユーザー（名前から学歴まで）情報を登録してもらってから、  
次にシフト希望とかんたんな質問に答えてもらうというエントリーをしてもらう形にしました。  
このアプリケーションの更なる展開として、同じユーザー情報から複数の店舗へ応募できる機能を搭載したいと考えております。  
  
# URL  
github  
https://github.com/hagiohagi/apply_easily_app  
認証コード  
ID: admin  
Pass: 2222  
  
# テスト用アカウント  
テストユーザー  
管理者用アカウント  
firstname: 萩原  
lastname: 誠人  
address: hagichan@gmail.com  
password: chan4444  
  
# ローカルでの動作方法  
$ git clone https://github.com/hagiohagi/apply_easily_app  
$ cd apply_easily_app  
$ bundle install  
$ rails db:create  
$ rails db:migrate  
  
・サーバーの起動  
$ rails s  
  http://localhost:3000  
  
・単体テストコードの実施  
$ bundle exec rspec spec/models/owner_spec.rb  
$ bundle exec rspec spec/models/user_spec.rb  
$ bundle exec rspec spec/models/parttime_spec.rb  
  
・結合テストコードの実施  
$ bundle exec rspec spec/system/owners_spec.rb  
$ bundle exec rspec spec/system/users_spec.rb  
$ bundle exec rspec spec/system/parttimes_spec.rb

# 要件  
・レスポンシブデザインの導入  
・deviseによるユーザーログイン機能(adminテーブル・userテーブル)  
・ウィザード形式を用いた複数ページにわたるデータ入力機能  
・ユーザー登録の確認画面と完了画面の導入  
・ActiveStorageによる画像保存機能  
・エラーメッセージの日本語化  
・Ciderによる自動コードレビュー  
・AWSのEC2インスタンスを関連づけたデプロイ  
・Capistranoを用いた自動デプロイ機能  
・各テーブルの登録に関する単体テストコード・結合テストコードの作成  

# 今後の実装予定
・複数店舗のエントリーができることを想定し、シフト入力と質問のエントリーを複数のテーブルで用意する。  
・検索機能を実装し、エントリーした応募者情報を特定しやすくする。

# データベース

## ER図  
<img width="326" alt="ER図" src="https://user-images.githubusercontent.com/68381420/98444840-6c6ebc80-2157-11eb-868a-1282a7a56e93.png">  


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

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
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
| fri_parttime_in  | integer    |                                |  
| fri_parttime_out | integer    |                                |  
| sat_parttime_in  | integer    |                                |  
| sat_parttime_out | integer    |                                |  
| pr_1             | string     | null: false                    |  
| pr_2             | string     | null: false                    |  
| pr_2             | string     | null: false                    |  
  
## Association
  belongs_to: user
