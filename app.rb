require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require 'pry'
require './lib/word_definer'

get '/' do
  @words = Word.all
  erb(:words)
end

get '/words' do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  name = params[:word_name]
  word = Word.new(name: name)
  word.save()
  @words = Word.all()
  erb(:words)
end