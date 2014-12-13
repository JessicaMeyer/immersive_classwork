# used this as a testing file then switched to my_pet_shop.rb

require 'pg'
require 'rest-client'
# require 'json'

# database name: petshop_db
# psql petshop_db

# get info from postman, create table, make the connection, copy info into table, create method to show all info 
# @pet_shop_info = RestClient.get("pet-shop.api.mks.io/shops")

class PetShop

        attr_reader :db

    def initialize
       @db = PG.connect(host: 'localhost', dbname: 'petshop_db') 

       create_tables 

end

    def create_tables   # entered tables into the database 
    
    # create the pet shops table

    shops = %q[
        CREATE TABLE IF NOT EXISTS petshop (  
                id SERIAL PRIMARY KEY,
                name VARCHAR
            );
     ]

    # create dogs table 

    dogs = %q[
         CREATE TABLE IF NOT EXISTS dogs_info (
                id SERIAL PRIMARY KEY,
                name VARCHAR,
                imageUrl VARCHAR,
                adopted VARCHAR,
                happiness INTEGER,
                shopId INTEGER 
            );
    ]

   
    # create cats table 

    cats = %q[
          CREATE TABLE IF NOT EXISTS cats_info (
                 id SERIAL PRIMARY KEY,
                 name VARCHAR,
                 imageUrl VARCHAR,
                 adopted VARCHAR,
                 shopId INTEGER 
            );
    ]

   
   db.exec(shops)
   db.exec(dogs)
   db.exec(cats)
    
     end

     def add_shop
         shops = JSON.parse(RestClient.get("http://pet-shop.api.mks.io/shops"))
        
         cats = shops.map 
    end
end

     # insert info into the tables 

    def insert_into_shop(name, id)   # need to insert the actual stores and ids now into the shop
       shop = "INSERT INTO shops (name, id) VALUES ($1, $2)"

      result = shop.exec_params(shop, [name, id])
      result.entries
end



end


___________________________________________________________________________________________

#testing 
require 'pg'
require 'rest-client'

def connect
  # pet_shop_info = RestClient.get("pet-shop.api.mks.io/shops")
  db = PG.connect(host: 'localhost', dbname: 'petshop.db')
end

def create_shop_table
  shops = %q[
    CREATE TABLE IF NOT EXISTS petshop (
    id SERIAL PRIMARY KEY,
    name VARCHAR
  );
]

  shops_table = db.exec(shops)
  shops_table.entries 
end

def add_shop
result = RestClient.get("pet-shop.api.mks.io/shops")
  shops = JSON.parse(result)
        
    shops.each do |shop|
        create_shop_table(shop["name"], shop["id"])
    end
end

def insert_into_shop(name, id)
  sql = "INSERT INTO shops (name, id) VALUES ($1, $2)"

  result = db.exec_params(sql, [name, id])
  result.entries
end





_____________________________________________________________________________________________


















#     x = response.map do |dog|
#     dog.values.join(',')
# end
# File.write('data.csv', x.join("\n"))
# path = Dir.pwd + "/data.csv"
# need to find the path to it  path = Dir.pwd + "/data.csv"
# will write out to the csv
# you're table has to be in that order of the hash btw
# then
# db.exec("COPY #{path}")

# require 'csv'
# require 'json'

# CSV.open("your_csv.csv", "w") do |csv| #open new file for write
#   JSON.parse(File.open("your_json.json").read).each do |hash| #open json to parse
#     csv << hash.values #write value to file
#   end
# end

# CSV.open("pet_shop.csv") do |csv|
#     response = RestClient.get('pet-shop.api.mks.io')
#     JSON.parse(response)
#     File.open(response)


# File.write('data.csv', response.join("\n"))
# path = Dir.pwd + "/data.csv"
# need to find the path to it  path = Dir.pwd + "/data.csv"
# will write out to the csv
# you're table has to be in that order of the hash btw
# then
# db.exec("COPY #{path}")


# database name: petshop.db
# psql petshop.db

# def create_petshops

#    pet_shop_info = RestClient.get("pet-shop.api.mks.io/shops")
#    shop_data = JSON.parse(pet_shop_info)

#    shop_data.each do |x| 
#      x["name"].gsub!(/[\\']/, "")   ##remove the darn apostrophes! LOL
#      db.exec("INSERT INTO petshops(id, name) VALUES (#{x["id"]}, '#{x["name"]}');")
#    end  

#  end


