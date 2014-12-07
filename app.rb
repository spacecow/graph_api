require 'sinatra'
require 'json'

class GraphApi < Sinatra::Base
  get '/universes' do
    {universes:[{title:'The Malazan Empire'}]}.to_json
  end
end
