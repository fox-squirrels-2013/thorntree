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



get '/posts' do
  @posts = Post.all
  erb :show_posts
end

get '/posts/new' do
  erb :create_posts
end

post '/posts' do
  Post.create! title:     params[:title],
               body:      params[:body],
               signature: params[:signature]

   redirect '/posts'
end