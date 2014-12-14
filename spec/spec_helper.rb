require 'rspec'
require 'rack/test'
require 'sinatra'
require './app'

include Rack::Test::Methods

def app; GraphApi end
