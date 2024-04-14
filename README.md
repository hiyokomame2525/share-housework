# アプリケーション名
share-housework

# アプリケーション概要
ユーザー2人でペアを作り、家事の実施割合を可視化して家事の分担について話し合うきっかけ作りをする。

# URL
https://share-housework.onrender.com

# テスト用アカウント
## ユーザー１

・ニックネーム：山田太郎

・メールアドレス：tarou@test.com

・パスワード：23456a

・誕生日：2000年,1月,1日

## ユーザー２

・ニックネーム：山田花子

・メールアドレス：hanako@test.com

・パスワード：34567a

・誕生日：1995年,1月,1日

# 利用方法
## ペア作成
1.トップページのヘッダーからユーザー新規登録をする。  
  ペア作成のために2人分実施する。
2.トップページのヘッダーに新しく追加された「ペアを作る」をクリック。IDを2人分入力してペア作成。
## 家事実施を投稿
トップページの「家事の記録をつける」ボタンから、ペアのどちらがどの家事をしたのかチェックボックスを選択してデータを保存する。
## 実施した家事割合の振り返り
トップページの「振り返り」ボタンから、1週間分の合算した家事実施割合を確認できる。

# アプリケーションを作成した背景
親や私の友人(同棲している、既婚者)、SNS等で家事の分担が共同生活をする上で不満になりやすいという事が分かり、解決方法を考えた。家事の実施割合が分かれば、話し合いがしやすいのではないかと仮定して、家事の実施割合を可視化できるアプリケーション開発をした。

# 実装した機能についての画像やGIFおよびその説明※


# 実装予定の機能
現在、当日の家事記録を編集しなおす編集機能を作成中。  
今後は、下記実装を予定。 

・当日の家事記録を削除する削除機能。

・ユーザー情報の編集機能。

・ユーザー情報の削除機能。

・ペアの削除機能。

・ペアの切り替え機能。


# データベース設計
"C:\Users\fuwaf\Downloads\share-houseworkのER図.png"

# 画面遷移図
"C:\Users\fuwaf\Downloads\share-houseworkの画面遷移図.png"

# 開発環境
・html/css
・Ruby/JavaScript 
・render：PostgreSQL
・テキストエディタ：VScode  
・タスク管理：github

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/hiyokomame2525/share-housework
% cd share-housework
% bundle install

# 工夫したポイント


# 改善点


# 制作時間


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
- has_many :houseworks

## houseworksテーブル

|Column             | Type       | Options                      |
|-------------------|------------|------------------------------|
|laundry            | boolean    | null: false                  |
|dishes             | boolean    | null: false                  |
|cooking            | boolean    | null: false                  |
|clean_room         | boolean    | null: false                  |
|bathroom           | boolean    | null: false                  |
|trash              | boolean    | null: false                  |
|toilet             | boolean    | null: false                  |
|pair               | references | null: false,foreign_key: true|

### Association
- belongs_to :pair