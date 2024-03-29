# テーブル設計

## usersテーブル

|Column                | Type     | Options                   |
|----------------------|----------|---------------------------|
|nickname              | string   | null: false               |
|email                 | string   | null: false, unique: true |
|encrypted_password    | string   | null: false               |
|birthday              | date     | null: false               |


### Association
- has_one :pair
- has_many :house_works


## pairsテーブル

|Column                  | Type       | Options                       |
|------------------------|------------|-------------------------------|
|user1_id                | references | null: false,foreign_key: true|
|user2_id                | references | null: false,foreign_key: true| 

### Association
- belongs_to :user1, class_name:'User'
- belongs_to :user2, class_name:'User'

## house_worksテーブル

|Column             | Type       | Options                      |
|-------------------|------------|------------------------------|
|work_name          | string     | null: false                  |
|count              | integer    | null: false                  |
|pair               | references | null: false,foreign_key: true|
|user               | references | null: false,foreign_key: true|

### Association
- belongs_to :pair
- belongs_to :user