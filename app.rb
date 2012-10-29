require 'sinatra'
require './people.rb'

people = People.new

get '/people', :provides => [:html] do
  @names = people.find_all_names
  erb :people
end

get '/people', :provides => [:json] do
  people.find_all_names(:json)
end

get '/people/:name', :provides => [:html] do
  if people.include? params[:name]
    @person = people.find(params[:name])
    erb :person
  else
    not_found
  end
end

get '/people/:name', :provides => [:json] do
  if people.include? params[:name]
    people.find(params[:name], :json)
  else
    "404 - This person is not found"
  end
end

not_found do
  halt 404, "Page not found"
end
