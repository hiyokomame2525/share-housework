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


## pairsテーブル

|Column     | Type       | Options                                    |
|-----------|------------|--------------------------------------------|
|user       | references | null: false,foreign_key: true              |
|partner    | references | null: false,foreign_key: {to_table: :users}| 

### Association
- belongs_to :user
- belongs_to :partner, class_name:'User'
- has_many :house_works

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
|created_at(記録日時)| created_at | null: false                  |
|pair               | references | null: false,foreign_key: true|

### Association
- belongs_to :pair