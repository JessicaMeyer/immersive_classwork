require 'sinatra'
require 'rest_client'
require 'json'

# set :bind, '0.0.0.0'

get '/' do
  erb :index
end

get '/movies' do
  @movies = JSON.parse(RestClient.get('http://movies.api.mks.io/movies'))
  erb :"movies/movies"
end

get '/actors' do
  @actors = JSON.parse(RestClient.get('http://movies.api.mks.io/actors'))
  erb :"movies/actors"
end

get '/movies/:id' do
  movie_url = 'http://movies.api.mks.io/movies/' + params[:id]
  @movie = JSON.parse(RestClient.get(movie_url))
  actor_url = 'http://movies.api.mks.io/movies/' + params[:id] + '/actors'
  @actors = JSON.parse(RestClient.get(actor_url))
  erb :"movie_show"
end

get '/actors/:id' do
  actor_url = 'http://movies.api.mks.io/actors/' + params[:id]
  @actor = JSON.parse RestClient.get actor_url
  movies_url = 'http://movies.api.mks.io/actors/' + params[:id] + '/movies'
  @movies = JSON.parse RestClient.get movies_url
  erb :"actor_show"
end

# don't commit vendor folder to repo 
# touch .gitignore 
# vendor/bundle in .gitignore file 


