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

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| date_of_birth   | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| image         | string  | null: false |
| name          | string  | null: false |
| description   | text    | null: false |
| price         | integer | null: false |
| exhibitor     | string  | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Shipping_address テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |

### Association

- belongs_to :order