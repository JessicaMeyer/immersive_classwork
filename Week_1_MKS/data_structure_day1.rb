# DATA STRUCTURE : Part 1 


# A Book
# Write an array and/or hash representation of the following data about a book I like:

# My like the book Gourd of the Flies, written by J. W. Gourding.

favorite_book = {:author => "J.W. Gourding", :title => "Gourd of the Flies"}

# A Library of Books
# Write an array and/or hash representation of the following data:

#  I have a small library of books:
# Design Patterns, by John Vlissides, Richard Helm, Ralph Johnson and Erich Gamma.
# Patterns of Enterprise Application Architecture, by Martin Fowler
# Domain Driven Design, by Eric Evans

# consistent data structures - array of names in first, but others are not in array

library_books = [
	
	{   :title => "Design Patterns", 
		:author => ["John Vlissides", "Richard Helm", "Ralph Johnson", "Erich Gamma"]
	},
	{
		:title => "Patterns of Enterprise Application Architecture",
		:author => ["Martin Fowler"]
	},
	{
		:title => "Domain Driven Design"
		:author => ["Eric Evans"]
	}

]

def authors(books)
	books.each do |book|
		book[:author].map { |x| puts x }
	end
end


# A Volunteer's Information
# Write an array and/or hash representation of the following data about a volunteer:

# The DoGood organization has just received a new volunteer application. The volunteer's name is Alice. She is 
# 25 years old. Her phone number is 555-555-5555. She is volunteering for the event receptionist position.



organization = { :organization_name = "DoGood", :volunteer => "Alice", :age => 25, :phone => "555-555-5555", :title => "Event Receptionist" }

# Managing State
# Write an array and/or hash representation of the following data:

# The state of Rhode Island (abbreviated RI) is home to 1,050,292 people - all of whome are known as Rhode Islanders - and its capital is 
# Providence. Along with Providence its most populous cities are Warwick and Cranston. The median household income is $54,619 and the governor 
# is Lincoln Chafee.


state = [ 
	{:state_name => "Rhode Island", 
		:abbreviation => "RI", 
		:people_nickname => "Rhod Islanders", 
		:population => 1_050_292,
		:capital => "Providence", 
		:populous_cities => ["Providence", "Warwick", "Cranston"], 
		:median_income => 54_619}, 
		:governor => "Lincoln Chafee"}	
  ]


# Patrick's New Laptop
# Write an array and/or hash representation of the following data:

# Patrick just bought a new laptop to take to his coding bootcamp. He chose an Apple MacBook Air with a 256GB solid state drive. 
# He chose 8GB of ram because that was the max allowed. His MacBook also has a Retina display and an i7 processor from Intel. 
# It came preloaded with the following software: iPhoto, Safari, iMovie, and iMessage.


patricks_laptop = {
	brand: "Apple",
	model: "Macbook Air",
	storage: {
		size: 256,
		type: "SSD"
	},
	memory: 8,
	display: {
		type: "Retina",
		size: 13.3
	},
	cpu: {
		manufacturer: "Intel",
		model: "i7",
	},
	software: ["iPhoto", "Safari", "iMovie", "iMessage"]

}


# The Restaurant (part 1)
# Model the following data about a fictional restaurant.

# Write an array and/or hash representation of the following data:

 # Nick's new favorite restaurant is Patrick's Pizza Palace. It is located at 716 Congress and last received a health 
 # score of 100! Nick's favorite meal at Patrick's Pizza Palace is mozarella sticks for the appetizer, chicken parmigiana 
 # for the entree and tiramisu for dessert. Kate's favorite meal combo is a calzone for an appetizer, a slice of pizza for the 
 # entree and a cannoli for dessert. Sometimes they go with Harsh, who is a vegetarian. He usually orders garlic knots, spaghetti & 
 # eggplant, and cheesecake.



restaurant_hash = {

	    :restaurant => "Patrick's Pizza Palace"
		:location => "716 Congress"
		:health_score => 100
	},
	 "Nick" = {
		:fav_app => "Mozzarella Sticks"
		:fav_entree => "Chicken Parmigiana"
		:fav_dessert => "Tiramisu"
	},
	"Kate" = {
		:fav_app => "Calzone"
		:fav_entree => "Pizza"
		:fav_dessert => "Cannoli"
	},
	"Harsh" = {
		:fav_app => "Garlic Knots"
		:fav_entree => "Spaghetti and Eggplant"
		:fav_dessert => "Cheesecake"
		:special_diet => "Vegetarian"
	}
}

# The Restaurant (part 2)
# Considering the description of Patrick's Pizza Palace create a new Ruby class (or more if you deem it necessary) 
# to encapsulate this information.
# work in progress 

class Restaurant 

    attr_reader :restaurant, :location, :health_score, :favorite_meals

	def initialize(restaurant, location, health_score)
		@restaurant = restaurant
		@location = location 
		@health_score = health_score
        @favorite_meals = []
	end

    def add_favorites(name, appetizer, entree, dessert)

        @favorite_meals << {
            :name => "name"
            :appetizer => "appetizer"
            :entree => "entree"
            :dessert => "dessert"
        }
    end

    def sentence 
        @favorite_meals.each do |x|
            puts "#{x[:name]} fav app is #{x[:appetizer]}, fav entree is #{x[:entree]}, and fav dessert is #{x[:dessert]}."
        end
    end
end


restaurant = Restaurant.new("TacoDeli", "1907 Spyglass", 150)


# Nick's example 
# class Restaurant 

# def initialize (name, address, health_score)
#     @name, @address, @health_score = name, address, health_score
#     @menu = {
#         appetizer = []
#         entrees = []
#         desserts = []
#     }
# end

# def add_menu_item(category, item)
#     if !@menu[category]
#         @menu[category] = [item]
#     else
#         @menu[category] << item
#     end
# end
# end























