# Ruby version jo aapki app use kar rahi hai
FROM ruby:3.2.2

# System dependencies install karein
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    imagemagick \
    yarn

# Work directory set karein
WORKDIR /app

# Gemfile aur lock file copy karein
COPY Gemfile Gemfile.lock ./

# Bundler install karein aur gems install karein
RUN gem install bundler:2.4.10
RUN bundle install

# Baqi sara code copy karein
COPY . .

# Assets precompile karein (Production ke liye)
ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile

# Port expose karein
EXPOSE 3000

# Server start karne ki command
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
