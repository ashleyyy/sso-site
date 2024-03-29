# frozen_string_literal: true

require 'bundler/setup'
require 'rubygems'

require 'active_support/all'

# Load Sinatra Framework (with AR)
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/contrib/all' # Requires cookies, among other things

require 'dotenv/load'
require 'jwt'

APP_ROOT = Pathname.new(File.expand_path('..', __dir__))
APP_NAME = APP_ROOT.basename.to_s

# Global Sinatra configuration
configure do
  set :root, APP_ROOT.to_path
  set :server, :puma

  enable :sessions
  set :session_secret,
      ENV['SESSION_KEY'] || 'fbab0134494b33486344d05fd70d98b98f3b35d4bb84336d0679b6bfc7bb1cbb'

  set :views, File.join(Sinatra::Application.root, 'app', 'views')
end

# Development and Test Sinatra Configuration
configure :development, :test do
  require 'pry'
end

# Production Sinatra Configuration
configure :production do
  # NOOP
end

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Load the routes / actions
require APP_ROOT.join('app', 'actions')
