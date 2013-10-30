require 'sinatra'
require 'active_record'
require_relative 'models/post'
require_relative '../db/seed'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'thorntreedb')
# user arrives as guest
get '/' do
  erb :index
end
