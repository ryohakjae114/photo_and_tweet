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

5. master.keyをconfig/に作成

6. userの作成
```ruby
FactoryBot.create(:user, user_id: 'sample', password: '1234512345')
```

7. アプリケーションの起動
```bash
bin/dev
```
