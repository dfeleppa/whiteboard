ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


set :database, {
  adapter: "sqlite3",
  database: "#{ENV['SINATRA_ENV']}.sqlite3"
}

require './app/controllers/application_controller'
require_all 'app'
