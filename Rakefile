# frozen_string_literal: true

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require ::File.expand_path('config/environment', __dir__)
  end

  desc 'Retrieves the current schema version number'
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end
