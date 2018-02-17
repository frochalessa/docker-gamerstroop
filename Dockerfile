FROM ruby
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /gamerstroop
WORKDIR /gamerstroop
COPY gamerstroop/Gemfile /gamerstroop/Gemfile
COPY gamerstroop/Gemfile.lock /gamerstroop/Gemfile.lock
RUN bundle install
COPY gamerstroop /gamerstroop
EXPOSE 3000
CMD [ "bundle", "exec", "puma", "-C", "config/puma.rb" "unix:///tmp/gamerstroop.sock" ]