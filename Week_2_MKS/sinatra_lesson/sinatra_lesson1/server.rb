# Sinatra lesson 

require 'sinatra'

set :bind, '0.0.0.0'

get '/' do 
    "Hey, this is a web app"
end

get '/hello' do 
    "Hello friends!"
end

# the file size of the response - i.e. the number of bytes 

# irb(main):040:0> "hey, this is a web app".size
# => 22

# ASCII (American Standard Code for Information Interchange)
# is a character encoding scheme. Represent text in computers.

# sinatra is good for routing, view templating, ERB (embedded ruby)