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
- has_many :buys


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| text         | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| sipping_id   | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| users        | references | null: false, foreign_key: true |
| buys         | references | null: false, foreign_key: true |
| seller       | string     | null: false, unique: true      |

### Association

- belongs_to :users
- belongs_to :buys


## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| users      | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items
- has_one    :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
|building       | string     | null: false                    |
| tel           | string     | null: false                    |
| buys          | references | null: false, foreign_key: true |

### Association

- belongs_to :buy