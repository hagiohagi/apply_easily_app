# README

# アプリケーション名  
### かんたん履歴書登録(apply_easily_app)  

![Alt text](https://i.gyazo.com/0e7f75dadc4d51b2984bf3ced8c0fa10.png)
![Alt text](https://i.gyazo.com/f786a36c7a5cbad585e4f2d59f7451c3.png)

# 概要  
  
アルバイト採用担当者が、応募者のプロフィールを閲覧することができるアプリケーションです。  
  
個人経営の店舗を想定して、アルバイト募集を効率化することを目的に作成しました。  
紙媒体の履歴書のデータをweb入力できるようにすることで、  
・応募側がボールペンで履歴書を記入する手間(etc.書き間違えたら最初から書き直し)を省く  
・採用側の紙媒体で個人情報を管理するコストを省く  
・採用側が事前に応募者の情報を知ることで効率よく面接することができる  
以上の課題解決に繋げられると考えました。  
  
機能としては、  
・応募に必要な情報を記入して登録する。  
・管理者用アカウントでログインし、登録されたデータを閲覧する。  
この2つに大きく分けられます。  
  
# 工夫点  
  
## ・ウィザード形式でページを整理する  
応募にあたっての入力項目が多いので、ウィザード形式を導入して、  
名前→住所→経歴と入力内容ごとにページが遷移するようにして、視認性を高めました。  

![Alt text](https://i.gyazo.com/255bc703dd5d233db4e6adbe3a951277.png)
![Alt text](https://i.gyazo.com/a667edb7bb1f88c3fce2e36cf227cfcd.png)
![Alt text](https://i.gyazo.com/c03f478aeda801138fbf714962ed9d2c.png)

## ・登録確認画面と登録完了画面を実装する
railsのdeviseの初期設定では、入力 → 完了(画面表示なし)で終わってしまうところを
コントローラを工夫して、入力 → 確認画面 → 完了画面と画面が見やすいようにページ推移を工夫しました。
  
## ・ユーザー登録とエントリーを分ける  
昨今の転職サイトで「ユーザー登録→企業ごとにエントリーする」という手順が多かったので、  
応募の手順を、まずユーザー（名前から学歴まで）情報を登録してもらってから、  
次にシフト希望とかんたんな質問に答えてもらうというエントリーをしてもらう形にしました。  
このアプリケーションの更なる展開として、同じユーザー情報から複数の店舗へ応募できる機能を搭載したいと考えております。  
  
# URL  
## github  
https://github.com/hagiohagi/apply_easily_app  
## Elastic IP  
13.112.254.248  
## 認証コード  
ID: admin  
Pass: 2222  
  
# テスト用アカウント  
## テストユーザー  
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
  
## ・サーバーの起動  
$ rails s  
  http://localhost:3000  
  
## ・単体テストコードの実施  
$ bundle exec rspec spec/models/owner_spec.rb  
$ bundle exec rspec spec/models/user_spec.rb  
$ bundle exec rspec spec/models/parttime_spec.rb  
  
## ・結合テストコードの実施  
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
