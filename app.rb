require 'active_record'
require './config/database'
require './app/models/universe'
require 'sinatra'
require 'json'
require 'pry'

class GraphApi < Sinatra::Base
  class ValidationError; end

  configure do 
    set :show_exceptions, false
    set :raise_errors, false
  end

  error ActiveRecord::StatementInvalid do |e|
    {error:e.message, type:ValidationError.to_s}.to_json
  end

  #error do |e|
  #  #halt 500, {error:e.message, type:e.class}.to_json
  #  {error:e.message, type:e.class}.to_json
  #end

  get '/universes' do
    {universes:Universe.all}.to_json
  end

  post '/universes' do
    {universe:Universe.create(params)}.to_json
  end

  delete '/universes' do
    ret = Universe.all.to_a
    Universe.delete_all
    {universes:ret.map{|e| {universe:e}}}.to_json
  end
end
