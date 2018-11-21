# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).# Make Me

This repositori is for reviewing yourself.

Please utilize by all means

Things you may want to cover:

* Ruby version

```
  2.5.1
```

* Rails version

```
  5.2.1
```

* System dependencies

* Configuration

* Database creation

* Database initialization

```
  MySQL ver 5.7 in gems 0.5.2
```

* How to run the test suite

    request : RSpec

    lint : Rubocop

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* サーバ立ち上げ

```
  $ bundle exec rails s -b 0.0.0.0
```

もしできなかった場合、、、

```
  $ bundle exec rails db:create
```

* マイグレーション

```
  $ bundle exec rails db:migrate
```

* テスト実行

```
  $ bundle exec rspec [ファイル名(ディレクトリも指定)]
```

* rubocop(Lintチェック)実行

```
  $ bundle exec rubocop -a
```

* ルーティング確認

 ```
  $ bundle exec rails s -b 0.0.0.0

  ブラウザで
  localhost:3000/rails/info/routes  にアクセス。
 ```
