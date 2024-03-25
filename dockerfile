# Rubyのバージョンを指定
FROM ruby:2.7

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ワークディレクトリの設定
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerを使ってGemをインストール
RUN bundle install

# ホストのカレントディレクトリの内容をコンテナにコピー
COPY . /myapp

# ポート3000番を開放
EXPOSE 3000

# Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
