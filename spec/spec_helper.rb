require 'rspec'
require 'rspec/its'
require 'rack/test'
require './app'
require 'factory_girl'
require './spec/factories'

include Rack::Test::Methods

def app; GraphApi end
