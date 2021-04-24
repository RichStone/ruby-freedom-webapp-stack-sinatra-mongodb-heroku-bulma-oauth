require 'sinatra'
require 'sinatra/reloader' if development?
require 'dotenv/load'
require 'mongoid'
project_root = File.dirname(__FILE__)
Mongoid.load!(File.join(project_root, 'mongoid.yml'))

class User
  include Mongoid::Document

  field :email, type: String
end

get '/users' do
  User.all.to_json
end

get '/users/:id' do
  User.find(params[:id]).to_json
end

post '/users' do
  user = User.create!(params[:user])
  user.to_json
end

patch '/users/:id' do
  user = User.find(params[:id]).update(params[:user])
  user.to_json
end

delete '/users/:id' do
  user = User.find(params[:id]).delete
  user.to_json
end

get '/freedom' do
  '“Freedom is not worth having if it does not include the freedom to make' \
  ' mistakes.” - Mahatma Gandhi'
end
