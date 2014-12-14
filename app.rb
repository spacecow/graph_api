require 'active_record'
require './config/database'
require './app/models/universe'
require 'sinatra'
require 'json'

class GraphApi < Sinatra::Base
  get '/universes' do
    {universes:[{title:'The Malazan Empire'}]}.to_json
  end

  post '/universes' do
    Universe.create(params).to_json
  end
end
