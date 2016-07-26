FROM ruby:2.3-alpine
COPY ./bot.rb /bot.rb
CMD ruby /bot.rb
