# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| first_name_kanji   | string  | null: false              |
| last_name_kanji    | string  | null: false              |
| first_name_kana    | string  | null: false              |
| last_name_kana     | string  | null: false              |
| birthyear_id       | integer | null: false              |
| birthmonth_id      | integer | null: false              |
| birthday_id        | integer | null: false              |



### Association

- has_many :items
- has_many :purchases
- has_one :address
- belongs_to_active_hash :birthyear
- belongs_to_active_hash :birthmonth
- belongs_to_active_hash :birthday



## items テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| name             | string      | null: false                    |
| text             | text        | null: false                    |
| category_id      | integer     | null: false                    |
| condition_id     | integer     | null: false                    |
| postage_id       | integer     | null: false                    |
| prefecture_id    | integer     | null: false                    |
| day_id           | integer     | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchace
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :day




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
| prefecture_id    | integer     | null: false                    |
| city             | string      | null: false                    |
| block            | string      | null: false                    |
| building         | string      | null: false                    |
| phone_num        | integer     | null: false                    |
| purchase         | references  | null: false, foreign_key: true |


### Association

- has_one :purchase
- belongs_to_active_hash :prefecture