FROM ruby:2.3-alpine
RUN gem install bundler
WORKDIR /usr/src
COPY Gemfile Gemfile.lock ./
RUN bundler install --deployment
COPY . .
CMD ["ruby", "main.rb"]
