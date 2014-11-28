# Sinatra lesson 

require 'sinatra'

set :bind, '0.0.0.0'

get '/welcome' do 
    erb :welcome
end

get '/welcome/:name' do 
    puts params
    erb :welcome
end

#  -> /welcome/jessica:4567/welcome/jessica
# {"splat"=>[], "captures"=>["jessica"], "name"=>"jessica"}

get '/say/*/to/*' do
  puts params
  erb :say
end

# {"splat"=>["hello", "shehzan"], "captures"=>["hello", "shehzan"]}

# {"splat"=>["hello", "shehzan/jessica/chris/spike"], "captures"=>["hello", "shehzan/jessica/chris/spike"]}

get '/test' do
  erb :info
end

# post '/info-summary' do
#   puts params
# end

# 10.10.10.1 - - [28/Nov/2014:21:43:09 UTC] "GET /gather-info HTTP/1.1" 200 954
# - -> /gather-info
# {"name"=>"jessica", "mail"=>"jess@gmail.com", "vegetarian"=>"on", "bloodtype"=>"A"}

#  http://10.10.10.10:4567/test
post '/test' do
  puts params
  @name = params[:name]
  @email = params[:mail]
  @vegetarian = params[:vegetarian]
  @blood_type = params[:bloodtype]
  erb :summary
end

# dog registration exercises 

get '/dog' do
    erb :info2
end

get '/dog-results' do
    puts params
  @name = params[:name]
  @dogtype = params[:dogtype]
  @age = params[:age]
    erb :summary2
end

# http://10.10.10.10:4567/dog-results?name=spike&dogtype=chihuahua&age=10

# Name: spike
# Dog Type: chihuahua
# Age: 10



