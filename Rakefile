require 'sinatra/activerecord/rake'
require './app/app'


namespace :db do
  desc "create the postgres database"
  task :create do
    `createdb thorntreedb`
  end

  desc "drop the postgres database"
  task :drop do
    `dropdb thorntreedb`
  end

  desc "seed the database"
  task :seed do
    SeedDB.populate
  end
end