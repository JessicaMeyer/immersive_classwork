require 'sinatra'
require 'pig_latin' 

set :bind, '0.0.0.0'

get '/translate' do
  erb :translate, layout: :layout
end

post '/translate' do
    puts params
  erb :result, layout: :layout
end

post '/test' do
  puts params
  @word = params[:word]
end