require 'sinatra'
require './people.rb'

people = People.new

get '/' do
  @names = people.find_all_names
  p @names
  erb :people
end

get '/:id' do
  puts params[:id]
  if people.include? params[:id]
    @person = people.find(params[:id])
    erb :person
  else
    not_found
  end
end

not_found do
  halt 404, "Page not found"
end