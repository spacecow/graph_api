require 'active_record'
require './config/database'
require './app/models/universe'
require './app/models/user'
require 'sinatra'
require 'json'
require 'pry'

class GraphApi < Sinatra::Base
  class ValidationError; end

  configure do 
    set :show_exceptions, false
    set :raise_errors, false
  end

  #TODO ActiveRecord::RecordNotUnique
  error ActiveRecord::StatementInvalid do |e|
    {error:e.message, type:ValidationError.to_s}.to_json
  end

  error NoMethodError do |e|
    p e.class
    p "Method does not exist: #{e.message}"
  end

  error NameError do |e|
    p e.class
    p "Route does not exist." and return if e.is_a?(Sinatra::NotFound)
    p "Constant does not exist: #{e.message}"
  end

  #error do |e|
  #  p e
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

  post '/login' do
    user = User.where(email:params["email"]).first
    if user && user.password == params[:password]
      {success:"User authenticated"}.to_json
    else
      {error:"Authentication failed"}.to_json
    end
  end

end
