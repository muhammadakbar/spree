FROM ruby:3.2.2

# Dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev nodejs npm imagemagick yarn git

WORKDIR /app

# Sab se pehle spree folder ka saara code copy karein
COPY spree/ .

# Gems install karein
RUN gem install bundler:2.4.10
RUN bundle lock --add-platform x86_64-linux
RUN bundle install

ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile || true

EXPOSE 3000

# Start command
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
