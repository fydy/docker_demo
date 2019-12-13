require 'rubygems'
require 'bundler/setup'
require 'sinatra'

set :port, 3000
set :environment, :production

get '/' do
  'Hello world'
end
