# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| text       | text       | null: false                    |
| price      | integer    | null: false                    |
| category   | string     | null: false                    |
| condition  | string     | null: false                    |
| sipping    | string     | null: false                    |
| area       | string     | null: false                    |
| day        | string     | null: false                    |
| users      | references | null: false, foreign_key: true |
| buys       | references | null: false, foreign_key: true |
| seller     | string     | null: false, unique: true      |

### Association

- belongs_to :users
- belongs_to :buys


## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| who        | string     | null: false                    |
| when       | datetime   | null: false                    |
| what       | string     | null: false                    |
| users      | references | null: false, foreign_key: true |
| items      | references | null: false, foreign_key: true |
| buyer      | string     | null: false,                   |

### Association

- belongs_to :user
- has_many   :items
- has_one    :address


## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| tel         | string     | null: false                    |
| buys        | references | null: false, foreign_key: true |

### Association

- belongs_to :buy