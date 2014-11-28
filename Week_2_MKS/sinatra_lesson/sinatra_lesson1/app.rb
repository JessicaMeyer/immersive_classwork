require 'rubygems'
require 'sinatra'
# require 'pry-byebug'

set :bind, '0.0.0.0' # for Vagrant

get '/time' do
  erb :time # This will look for a file called 'views/time.erb'
end

# getting an error with pry-byebug so had to comment out in order to get it to work. 

# add another route 

get '/gather-info' do
  erb :info
end

# post '/info-summary' do
#   puts params
# end

# 10.10.10.1 - - [28/Nov/2014:21:43:09 UTC] "GET /gather-info HTTP/1.1" 200 954
# - -> /gather-info
# {"name"=>"jessica", "mail"=>"jess@gmail.com", "vegetarian"=>"on", "bloodtype"=>"A"}

post '/info-summary' do
  puts params
  @name = params[:name]
  @email = params[:mail]
  @vegetarian = params[:vegetarian]
  @blood_type = params[:bloodtype]
  erb :summary
end

# Name: jessica
# Email: jess@gmail.com
# jessica is a vegetarian
# Blood Type: A


