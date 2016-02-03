require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'uri'
require 'net/http'
require 'json'


get '/' do
  erb :index
end

get '/kana' do
  @result = Romaji.romaji2kana params[:romaji]
  erb :show
end

get '/football' do
  uri = URI.parse('http://api.football-data.org/v1/teams/5/players')
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)
  p result
  players = result['players'].map { |e| e['name']  }
  players
end
