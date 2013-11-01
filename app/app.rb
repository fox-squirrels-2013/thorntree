require 'sinatra'
require 'active_record'
require_relative 'models/note'
require_relative '../db/seed'


ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'thorntreedb')

#######################################################
# CREATING
#######################################################
get '/notes/new' do
  erb :create_notes
end

post '/notes' do
  Note.create! title:     params[:title],
               body:      params[:body],
               signature: params[:signature]

   redirect '/notes'
end


#######################################################
# SHOWING
#######################################################
get '/notes' do
  @notes = Note.all.shuffle[0..5]
  erb :show_notes
end

get '/notes/:id' do
  @note = Note.find(params[:id])
  erb :show_single_note
end


#######################################################
# EDITING
#######################################################


get '/notes/:id/edit' do
  @note = Note.find(params[:id])
  erb :edit
end

put '/notes/:id' do
  n = Note.find(params[:id])
  n.title = params[:title]
  n.body = params[:body]
  n.signature = params[:signature]
  n.save
  redirect "/notes/#{n.id}"
end


#######################################################
# DELETING
#######################################################
get '/notes/:id/delete' do 
  @note = Note.find(params[:id])
  erb :delete
end

delete '/notes/:id' do 
  @note = Note.find(params[:id])
  @note.destroy
  redirect '/notes'
end
