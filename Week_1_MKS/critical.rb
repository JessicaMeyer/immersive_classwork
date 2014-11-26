reviewers = ratings.map {|x| x["reviewer"]}.uniq
#  => ["Alice", "Johnny", "Nora Neyland", "Glenn", "julia", "Greg Mikeska", "Alex Ford", "Spenser", 
#     "John", "Tricia McTigrit", "charles", "jessica", "James", "Rufino"]

terse = ratings.select { |r| r["comment"].length < 30 }
# => all the comments less than 30 characters 

# Exercises
# Your task is to write a method in this file for each of the following exercises. Name each method as succinct as possible.
# before each one

require 'rest-client'
response = RestClient.get("critics.api.mks.io/restaurants")  #change last part of URL
require 'JSON'
ratings = JSON.parse(response)

# example for packing the JSON part into it's own method and using it in another method by savings to variable. 
# def movie_data
#   response = RestClient.get("critics.api.mks.io/restaurants")  
#   ratings = JSON.parse(response)
# end
# 

# def top_genre_by_average 
#   genre_list = movie_data
#   genres = genre_list.map {|x| x["genre"]}.uniq

#   averages = genres.map do |x|
#     ratings = genre_list.select {|y| y["genre"].to_i == x.to_i}
#     average = ratings.inject(:+) / ratings.size
#   end
# end


# 1) 
# Find all the restaurants with ratings 8 and above. Print them in the following format:

# ex:
# 10 - RestaurantName1
#  9 - RestaurantName2
#  8 - RestaurantName3

require 'rest-client'

def get_restaurants
  response = RestClient.get("critics.api.mks.io/restaurants")
  ratings = JSON.parse(response)
end

def ratings_above_8
  ratings.select do |r|
    if r["rating"].to_i >= 8
      puts "#{r["rating"]} - #{r["venue"]}"
    end
  end
end

# 2) 
# Find all the restaurants that have the word "Austin" in it (case-insensitive). Print them in the following format:

# Austin restaurants:
# RestaurantName1
# RestaurantName2


def austin_restaurants(ratings)
    ratings.select do |r|
        if r["venue"].downcase.include? "austin"
            puts "Austin restaurants: #{r["venue"]}"    
   end
  end
end

# => Austin restaurants: Austin Java

# 3) 

# Find the top 3 movie genres with the most ratings. Print them in the following format:

# Popular Movie Genres:
# Genre1 - 50 reviews
# Genre2 - 47 reviews
# Genre3 - 40 reviews

# movie_ratings = ratings.map {|r| r["rating"].to_i}.sort.reverse
#  => [10, 10, 10, 10, 10, 10, 10, 8, 5, 4, 4, 4, 3, 2, 2, 1, 1, 1]

def top_movies(ratings)
movie_ratings = ratings.sort_by {|h| [ h['rating'].to_i]}
     top_three = movie_ratings.last(3)

     top_three.select do |r|
       puts "#{r["rating"]} - #{r["genre"]}"
     end
 end

# 10 - Horror
# 10 - Action
# 10 - Romcom

# does the same thing 
# ratings[-3..-1]
# awesome.last(3)



# 4) 

# Find the top 3 movie genres with the highest average ratings. Print them in the following format:


# Top Movie Genres:  
# Genre1 - 50 reviews
# Genre2 - 47 reviews
# Genre3 - 40 reviews


# filter through genre and grab rating 

def top_genres_by_averages

  genre_list = movie_data

  genres = genre_list.map {|x| x["genre"]}.uniq


  averages = genres.map do |x|
    ratings = genre_list.select {|y| y["genre"].to_i == x.to_i}
    average = ratings.inject(:+)/ratings.size
    {x => average}

  end
end

# practice test code below for reference: 

# ex: win_lose.inject(Hash.new(0)) { |type, num| type[num] += 1; type }

# movie_ratings = ratings.sort_by {|h| [ h['rating'].to_i]}
#      top_three = movie_ratings.last(3)
#      # top three movie hash pairs

# ratings_array = ratings.map {|r| r["rating"].to_i}.sort.reverse
#  #=> [10, 10, 10, 10, 10, 10, 10, 8, 5, 4, 4, 4, 3, 2, 2, 1, 1, 1]
# ratings_array.inject {|sum, n| sum + n}.to_f / ratings_array.size
#  #=> 5.833333333333333

# genres = ratings.map {|x| x["genre"]}.uniq
# averages = genres.map do |x|
#   movie_ratings = ratings.select {|y| y["genre"]==x}
#   average = movie_ratings.inject(:+) / ratings.size
#      {x => average}
#  end

# avg_rating = top_three.values.flatten 
# grades.inject(0) do |sum, grade| sum += grade end.to_f / grades.length.


# 5) 

# Print out all cheeses to the console with the following format:

# Cheese1: A Charismic charette. --Charles
# Cheese2: A Charming character. --Chad

def cheeze(ratings)

cheese = ratings.sort_by { |x| [x["id"].to_i]}
   cheese.select {|ch| puts "#{ch["id"]}: #{ch["comment"]}. -- #{ch["reviewer"]}"}

end

# 1: Zorro loves mascarpone. -- Alice
# 2: I like it. It is really so fine.. -- Rembrandt Von Hasselhoft
# 3: Lovely bite with a hearty rind.  Could be worse.. -- Nora Neyland
# 4: Lovely bite with a hearty rind.  Could be worse.. -- Nora Neyland
# 5: Worst cheez evar. -- Brian
# 6: It is an alright cheese.. -- Glenn
# 7: I love cheeses and sharp cheddar is a favorite. LAH DEE DAH!!!!!. -- Greg Mikeska
# 8: smelly, but delicate on the palate. -- charles
# 9: Is this even cheese?. -- Spenser
# 10: Crumbles and falls apart in your mouth. Each piece of garlic is exquisitely cut to fall perfectly into the crevices of your molars. -- Alex Ford
# 11: Amazing if you're DF and Gluten Free.  Stretches well.. -- Tricia McTigrit
# 12: I'm dairy free and gluten free . -- jessica
# 13: Absolutely rotten!. -- James
# 14: I'm dairy free and gluten free . -- jessica
# 15: This is just a long comment. -- Greg
# 16: Yummity, yum-yum. -- Rufino
# 17: american cheese is not even really cheese.... -- PetitFromage
# 18: Simply the best.. -- Jason
# 19: Delicious with jam. -- Cris


# Nick's lecture on these problems ... 


array = [10, 20, 30, 40]
# reduce takes an optional starting value 
# first iteration r will be 0 and e will be 10
array.reduce(0) do |result, element|
    result + element
end

# When using reduce or inject, don't forget to return the hash in the method, so it iterates again.

counts = {'comedy' => 4, 'action' => 1, 'horror' => 10}
# sort by is an enumerable method 
counts.sort_by 
# if you call on the object with no block, it returns an instance of the enumerable class
x.first # of enumerator object, you get an array
=> ["comedy", 4]
counts.sort_by {|x| x.last}
counts.sort_by(&:last)

# can also do {|k,v| v} = return an array of arrays

# calculating averages 

a = (1..20).to_a
# we could use reduce again
total = a.reduce(0) {|r,e| r + e}.to_f
= 210.0
total / a.size
= 10.5

counts = sort_by {|x| [x.last, x.first]}


