require 'sinatra'
require 'active_record'
require_relative 'models/post'
require_relative '../db/seed'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'thorntreedb')

get '/posts' do
  @posts = Post.all
  erb :show_posts
end

get '/posts/new' do
  erb :create_posts
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show_single_post
end

post '/posts' do
  Post.create! title:     params[:title],
               body:      params[:body],
               signature: params[:signature]

   redirect '/posts'
end


get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.save
  redirect '/posts'
 end

get '/posts/:id/delete' do 
  @post = Post.find(params[:id])
  erb :delete
end

delete '/posts/:id' do 
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/posts'
end
