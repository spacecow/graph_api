require 'active_record'
require './app/models/universe'
require 'sinatra'
require 'json'

#set :database, 'sqlite://db/graphapi_test.db'

ENV['RACK_ENV'] = "test"
databases = YAML.load_file "config/database.yml"
ActiveRecord::Base.establish_connection databases[ENV['RACK_ENV']]

class GraphApi < Sinatra::Base
  get '/universes' do
    {universes:[{title:'The Malazan Empire'}]}.to_json
  end

  post '/universes' do
    Universe.create(params).to_json
  end
end
