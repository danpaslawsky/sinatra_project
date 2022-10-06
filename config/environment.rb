require 'bundler'
require 'rubygems'
require 'sinatra'

Bundler.require


ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/development.sqlite.3"
)

require_all 'app'
