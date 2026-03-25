# Ruby 3.2.2 use karein
FROM ruby:3.2.2

# System dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential libpq-dev nodejs npm imagemagick yarn git

WORKDIR /app

# --- YAHAN CHANGE HAI ---
# Hum spree folder ke andar se Gemfile uthayenge
COPY spree/Gemfile ./ 

# Agar spree/Gemfile.lock hai toh wo bhi copy karein (optional)
COPY spree/Gemfile.lock* ./

# Bundler setup
RUN gem install bundler:2.4.10
RUN bundle install || (bundle lock --add-platform x86_64-linux && bundle install)

# Baqi saara code spree folder se utha kar /app mein copy karein
COPY spree/ .

# Assets precompile
ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile || true

EXPOSE 3000

# Start command
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
