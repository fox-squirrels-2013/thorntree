require 'sinatra'
require 'active_record'
require_relative 'models/babble'
require_relative 'models/note'
require_relative 'models/reed'
require_relative '../db/seed'

use Rack::Session::Cookie, :key => 'rack.session',
                           :domain => 'thorntree',
                           :path => '/',
                           :expire_after => 2592000,
                           :secret => 'some secret'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'thorntreedb')

helpers do
  def track(breadcrumb)
    session[:breadcrumbs] ||= ''
    session[:breadcrumbs] += "\n#{breadcrumb}"
    puts session[:breadcrumbs]
  end
end

#######################################################
# CREATING
#######################################################

get '/notes/new' do
  track("started creating a new note")

  erb :create_notes
end

post '/notes' do
  note = Note.create!
  note.babbles << Babble.create!(params[:babble]
                                .merge(original_note: true))
  track("finished creating note [#{note.id}]")
  redirect '/notes'
end

#######################################################
# SHOWING
#######################################################

get '/notes' do
  # session[:message] = '' if session[:message].nil?
  # puts session[:message] += "\n arrived at the homepage"
  track("arrived at home page")

  @notes = Note.still_on_tree # .shuffle[0..5]
  @notes.map(&:decay!)
  @notes = Note.still_on_tree # .shuffle[0..5]
  erb :show_notes
end

get '/notes/:id' do
  track("viewed note [#{params[:id]}]")

  @note = Note.find(params[:id])
  @note.holes += 1
  @note.save
  erb :show_single_note
end


#######################################################
# EDITING
#######################################################

# shows the form to edit a note
get '/notes/:id/edit' do
  track("started editing note [#{params[:id]}]")

  @note = Note.find(params[:id])
  erb :edit
end

# receives the post from the edit form
put '/notes/:id' do
  track("finished editing note [#{params[:id]}]")
  n = Note.find(params[:id])
  n.babbles << Babble.create!(params[:babble])
  redirect "/notes/#{n.id}"
end

#######################################################
# DELETING
#######################################################

get '/notes/:id/delete' do 
  track("started deleting note [#{params[:id]}]")

  @note = Note.find(params[:id])
  erb :delete
end

delete '/notes/:id' do 
  track("finished deleting note [#{params[:id]}]")

  @note = Note.find(params[:id])
  @note.destroy
  redirect '/notes'
end


#######################################################
# SEARCHING
#######################################################

get '/search' do
  "show the search form"
  erb :search_form
end

post '/search' do
   # params #{"search"=>"asdasd"}
   # SELECT id FROM babbles WHERE body like '%partner%'
   # Babble.where("body like '%partner%'")
   results = Babble.where("body like '%#{params[:search]}%'")

   # the following search deletes all Babbles in the db
   # test'); delete from babbles where 1 = 1; select * from babbles where (body like 'test
   # this might work too (untested)
   # test'); delete from babbles where 1 = 1; -- 
   # and then this would fix it (untested)
   # results = Babble.where("body like '%?%'", params[:search])

   content = results.all.map(&:title).join("<br>")

   output  = "<pre>"
   output += "we got #{results.count} results."
   output += "\n\n#{content}</pre>"
   output
end


#######################################################
#######################################################
#
# DO NOT PUT ANY ROUTES BELOW THIS LINE
#
#######################################################
#######################################################
# catch-all route
#
# note: if anything wierd is happening with routes
# it's probably because you put them below this line
#######################################################
get '/*' do
  track("tried to view a nonexistent page")
  redirect '/notes'
end
