# DATA STRUCTURE : Part 2

# A List of Recipes
# Assuming we will need to sort ingredients by amount, write an array (or hash) and object representation of the following data:


# below - 
# first line is always the title 
# second is the number of servings  - appears to be serves 1 word, some # as second word 
# the empty line between the recipe lists would look like ""\n 

# apple salad
# serves 4
# 6 oz mixed greens
# 1 tbs honey mustard
# 2 tbs almonds
# 4 apples -- number, apples - 
# salt and pepper

# bean burgers
# serves 4
# 2 lbs black beans
# 4 buns
# lettuce
# 8 tomatoes, sliced thinly - prep instructions separated by a comma
# 1 cup feta cheese
# mustard

# avocado soup
# serves 2
# 1 avocado
# 1 soup
# cookies




recipes = [
    "apple salad" = {
        :serves => 4
        :ingredients = {["6 oz mixed greens", "1 tbs honey mustard", "2 tbs almonds", "4 apples", "salt and pepper"]}
    },
    "bean burgers" = {
        :serves => 4
        :ingredients = {["2 lbs black beans", "4 buns", "lettuce", "8 tomatoes, sliced thinly", "1 cup feta cheese", "mustard"]}
    },
    "avocado soup" = {
        :serves => 2
        :ingredients => {["1 avocado"]}
    }
    
]

# text has recipe name, servings, ingredients 
# ingredients have units of measuresments - oz, tbl, tsp, lbs, cup    - need to know if word is in the list - if word.include?(unit)
# apple salad - number, unit, type of ingredient
# 4 buns - if there is no unit, assume it is name of ingredient

class Recipe

  attr_reader :title, :servings, :ingredients
 
  def initialize(name, servings)
    @title = title
    @servings = servings
    @ingredients = []
  end
 
  def add_ingredient(ingredient)
    @ingredients << ingredient
  end
 
end

class Ingredients 

    def initialize(amount, unit, type)
        @amount = amount 
        @unit = unit 
        @type = type 
    end

    def recipe_file
      recipe_file = File.read('recipes.txt')
      recipe_list = recipe_file.split(/\n\n/)  #double return , each string represents a recipe
      recipe_block.map { |x| x.split(/\n/) }
   end
 end

  
recipe = Recipe.new("Taco", 1)
recipe.add_ingredient(Ingredient.new(["1 corn tortilla, 2 eggs, salsa"]))


recipes = [
 {
    name: "apple salad",
    serves: 4,
    ingredients: [
        {
            name: "mixed",
            unit: "oz",
            amount: 6
        },
        {
            name:
        }
    ]
 }
]


data = File.read('recipes.txt')
data.split("\n\n")
data.split("\n\n").size # 3
data.map {|x| x.split("\n") } #each new line  - x represents a line of strings

#index 2 is where our ingredient list begins 
# "6 oz to mixed greens.to_i - would return 6"
# .match(/^\d/) instead of .to_f
# r[2..-1] - get an array with just the ingredients in it. 

# example answer 

class Parser 

def self.build_ingredient_hash(string)
    unit = ["oz", "lbs", "tbs", "cup"]
    amount = string.to_f  
    split = string.split

    if amount.zero?
        { name: string, units: "", amount: "" }
    elsif units.include?(split[1])
        { name: split[2..-1].join(" "), units: spilt[1], amount: amount }
    else 
        { name: split[1..-1].join(" "), units: "", amount: amount}      
    end    
end                  

def self.parse(file_name)
    data = File.read(file_name)
    recipes = data.split("\n\n")
    recipes.map! { |x| x.split("\n") }   # array of arrays


    recipes.map do |recipe|
        title = recipe.first
        servings = recipe[1].split.last.to_i
        ingredients = recipe[2..-1]

        ingredients.map! do |ingredient|
            build_ingredient_hash(ingredient) 
        end

        {
            title: title
            servings: servings
            ingredients: ingredients
        }
    end
  end
end


# in irb - require './parser.rb'
# => true
# book = Parser.parse('recipes.txt')
# book.size
# => 3
# book.first[:title]
# => apple salad
# book.first.keys
# book.first[:ingredients].each {|x| puts x[:name]}


# spin up ruby objects - just need to change the three lines in amount.zero that start with {name ...}








































