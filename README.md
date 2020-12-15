# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |
| last_name                 | string | null: false |
| first_name                | string | null: false |
| last_name_kana            | string | null: false |
| first_name_kana           | string | null: false |
| birthday                  | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| text         | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| shipping_id  | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy


## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |

### Association

- belongs_to :order