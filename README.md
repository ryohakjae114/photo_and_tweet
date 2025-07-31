* 合計所要時間: 11時間程度
# README

1. `git clone ssh://git@github.com:ryohakjae114/photo_and_tweet.git`

2. Ruby/Node.jsのインストール（asdfを使用した場合）
```bash
asdf install ruby
asdf install nodejs
```
3. 依存関係のインストール
```bash
bundle install
yarn install
```

4. データベースの設定
```bash
cp config/database.yml.sample config/database.yml
rails db:create
rails db:migrate
```

5. credentialsの作成
```
EDITOR="vim" bin/rails credentials:edit
```
```
# client_idとclient_secretは私に送っていただいたメールからご確認ください
my_tweet_app:
  client_id: ''
  client_secret: ''
  redirect_uri: 'http://localhost:3000/oauth/callback'
```

6. userの作成
```ruby
FactoryBot.create(:user, user_id: 'sample', password: '1234512345')
```

7. アプリケーションの起動
```bash
bin/dev
```
