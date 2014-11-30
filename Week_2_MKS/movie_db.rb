require 'pg'
require 'rest-client'

# createdb movie_db
# psql movie_db

class Movies 

    attr_reader :db 

    def initialize
        @db = PG.connect(host: 'localhost', dbname: 'movie_db')
        create_tables
    end

     def create_tables 
    
    # create the actors table

    actors = %q[
        CREATE TABLE IF NOT EXISTS actors (  
                id SERIAL PRIMARY KEY,
                name VARCHAR
            );
     ]

    # create the movies table 

    movies = %q[
         CREATE TABLE IF NOT EXISTS movies (
                id SERIAL PRIMARY KEY,
                title VARCHAR
            );
    ]

   
    # create the join table

    join_table = %q[
          CREATE TABLE IF NOT EXISTS join_table (
                 id SERIAL PRIMARY KEY,
                 actorId INTEGER,
                 movieId INTEGER
            );
    ]

   
   db.exec(actors)
   db.exec(movies)
   db.exec(join_table)
    
     end

     # add actor info 

     def add_actors
        actors = JSON.parse(RestClient.get("movies.api.mks.io/actors"))
        
        actors.map do |x|
            insert_into_actors(x["name"], x["id"])
      end
  end

     # insert actor info into actors table

    def insert_into_actors(name, id)   
       actors = "INSERT INTO actors (name, id) VALUES ($1, $2)"

       result = @db.exec_params(actors, [name, id])
       result.entries
end

     # add movies info 

     def add_movies
        movies = JSON.parse(RestClient.get("movies.api.mks.io/movies"))
        
        movies.map do |x|
            insert_into_movies(x["title"], x["id"])
      end
  end

     # insert movies info into movies table

    def insert_into_movies(title, id)   
       movies = "INSERT INTO movies (title, id) VALUES ($1, $2)"

       result = @db.exec_params(movies, [title, id])
       result.entries
end

    # add join table info 

     def add_join_table

        join_table = @db.exec("SELECT id FROM movies")

        movies =  []

        join_table.entries.map do |movie|
            url = "movies.api.mks.io/movies/" + movie["id"] + "/actors"
            result = RestClient.get(url)
            movies << JSON.parse(result)
        end

        movies.flatten!

        movies.map do |m|
            insert_into_join_table(m["id"], m["movieId"])
        end

    end

    # need to edit add_join_table

    # insert info into the join table 

     def insert_into_join_table(id, movieId)   
       join_table = "INSERT INTO join_table (actorId, movieId) VALUES ($1, $2)"

       result = @db.exec_params(join_table, [id, movieId])
       result.entries
    end

    # list all of the actors by name alphabetically - need to sort

    def actors_by_name 
        sql = "SELECT * FROM actors ORDER BY name"

        result = @db.exec(sql)
        result.entries
    end

    # list all of the movies by title alphabetically  - need to sort

    def movies_by_name 
        sql = "SELECT * FROM movies ORDER BY title"

        result = @db.exec(sql)
        result.entries
    end

    # list which actors appear most frequently in your database. 

    def most_frequent_actors
        sql = "SELECT COUNT(actorId) AS actor FROM join_table ORDER BY actor desc"

        result = @db.exec(sql)
        result.entries
    end

    # edit 

    # list all actors for a given movie title.

    def actors_in_movie_title
        sql = "SELECT DISTINCT title, name FROM join_table ON movieId = movieId ORDER BY title"

        result = @db.exec(sql)
        result.entries
    end

    # edit 


end