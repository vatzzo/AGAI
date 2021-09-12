FROM ruby:3.0.1

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libpq-dev &&\
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y nodejs yarn

WORKDIR /web

COPY Gemfile Gemfile.lock ./
COPY package.json package-lock.json yarn.lock ./

RUN bundle install
RUN bundle exec rails webpacker:install

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
