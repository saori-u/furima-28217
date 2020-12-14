# テーブル設計

## users テーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null: false, unique:true |
| password         | string | null: false              |
| password_confirm | string | null: false              |
| name_kanji       | string | null: false              |
| name_kana        | string | null: false              |

### Association

- has_many :items
- has_many :purchases
- has_one :address

## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| text             | text        | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchace



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postcode         | string      | null: false                    |
| city             | string      | null: false                    |
| block            | string      | null: false                    |
| building         | string      | null: false                    |
| phone_num        | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |
| purchase         | references  | null: false, foreign_key: true |


### Association

- has_one :user
- has_one :purchase