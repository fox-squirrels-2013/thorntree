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







get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  p @post
  erb :edit
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.save
  redirect '/'
 end

