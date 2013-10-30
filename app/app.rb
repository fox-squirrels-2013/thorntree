require 'sinatra'

# user arrives as guest
get '/' do
  erb :index
end
