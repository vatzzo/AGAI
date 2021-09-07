FROM ruby:3.0.1

WORKDIR /web

COPY Gemfile Gemfile.lock ./

RUN bundle install
RUN bundle exec rails webpacker:install

COPY . ./

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]