require 'active_record'
require './config/database'
require './app/models/universe'
require 'sinatra'
require 'json'
require 'pry'

class GraphApi < Sinatra::Base
  configure do 
    set :show_exceptions, false
    set :raise_errors, false
  end

  error ActiveRecord::StatementInvalid do |e|
    halt 500, {error:e.message, type:e.class}.to_json
  end

  #error do |e|
  #  halt 500, {error:e.message, type:e.class}.to_json
  #end

  get '/universes' do
    {universes:[{title:'The Malazan Empire'}]}.to_json
  end

  post '/universes' do
    Universe.create(params).to_json
  end

  delete '/universes' do
    Universe.delete_all
    {}.to_json
  end
end
