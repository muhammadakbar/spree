# Ruby 3.2.2 use karein
FROM ruby:3.2.2

# System dependencies install karein
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    imagemagick \
    yarn \
    git

# Work directory set karein
WORKDIR /app

# Pehle sirf Gemfile copy karein
COPY Gemfile ./

# Agar lock file nahi hai, toh ye command khud generate kar legi
RUN gem install bundler:2.4.10
RUN bundle install || bundle lock --add-platform x86_64-linux && bundle install

# Baqi sara code copy karein
COPY . .

# Assets precompile (Production mode)
ENV RAILS_ENV=production
RUN bundle exec rake assets:precompile

# Port expose
EXPOSE 3000

# Start command
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
