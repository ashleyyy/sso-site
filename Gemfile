# frozen_string_literal: true

# A sample Gemfile
source 'https://rubygems.org'

gem 'activesupport'
gem 'rake'

gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sinatra-contrib'
gem 'sinatra-flash'

gem 'jwt'

gem 'puma'
gem 'tux'

# These gems are only installed when run as `bundle install --without production`
group :development, :test do
  gem 'dotenv'
  gem 'pry'
  gem 'shotgun'
  gem 'sqlite3'
end

# bundle install --without test --without development
group :production do
  # use postgres in production, or move outside a group if your app uses postgres for development and production
  gem 'pg'
end
