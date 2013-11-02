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

# use this at the console
# the ; means "do the command and keep truckin"
# the && means "do the command and ONLY IF IT SUCCEEDS keep truckin"
# rake db:drop; rake db:create && rake db:migrate && rake db:seed