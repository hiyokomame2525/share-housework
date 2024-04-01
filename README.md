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
|user1_id                | references | null: false,foreign_key: true |
|user2_id                | references | null: false,foreign_key: true | 

### Association
- belongs_to :user1, class_name:'User'
- belongs_to :user2, class_name:'User'

## house_worksテーブル

|Column             | Type       | Options                      |
|-------------------|------------|------------------------------|
|laundry            | boolean    | null: false                  |
|dishes             | boolean    | null: false                  |
|cooking            | boolean    | null: false                  |
|clean_room         | boolean    | null: false                  |
|bathroom           | boolean    | null: false                  |
|trash              | boolean    | null: false                  |
|toilet             | boolean    | null: false                  |
|date               | date       | null: false                  |
|user               | references | null: false,foreign_key: true|

### Association
- belongs_to :user