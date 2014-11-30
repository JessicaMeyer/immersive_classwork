require 'pg'
require 'rest-client'

# database name: petshop_db
# psql petshop_db

class PetShop

    def initialize
       @db = PG.connect(host: 'localhost', dbname: 'petshop_db') 
       create_tables 
    end

    def create_tables 
    
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

    # add shop info 

     def add_shop
        shops = JSON.parse(RestClient.get("http://pet-shop.api.mks.io/shops"))
        
        shops.map do |shop|
            insert_into_shop(shop["name"], shop["id"])
      end
  end

     # insert shop info into petshop table

    def insert_into_shop(name, id)   
       shop = "INSERT INTO petshop (name, id) VALUES ($1, $2)"

       result = @db.exec_params(shop, [name, id])
       result.entries
end


    # add dog info 

    def add_dog

     shops = JSON.parse RestClient.get("http://pet-shop.api.mks.io/shops")
 
     dogs = shops.map do |shop|
      shop_id = shop['id']
      JSON.parse(RestClient.get("http://pet-shop.api.mks.io/shops/#{shop_id}/dogs"))
     end

     dogs.flatten!
 
        dogs.map do |dog|
            insert_into_dog(dog["id"], dog["shopId"], dog["name"], dog["imageUrl"], dog["happiness"], dog["adopted"])
        end

    end

    # insert dog info into dog info table

    def insert_into_dog(id, shopId, name, imageUrl, happiness, adopted)
        dog = "INSERT INTO dogs_info (id, shopId, name, imageUrl, happiness, adopted) VALUES AT ($1, $2, $3, $4, $5, $6)"

        result = @db.exec_params(dog, [id, shopId, name, imageUrl, happiness, adopted])
        result.entries
    end

    # add cat info 

    def add_cat

     shops = JSON.parse RestClient.get("http://pet-shop.api.mks.io/shops")
 
     cats = shops.map do |shop|
      shop_id = shop['id']
      JSON.parse(RestClient.get("http://pet-shop.api.mks.io/shops/#{shop_id}/cats"))
     end

     cats.flatten!
 
        cats.map do |dog|
            insert_into_cat(cat["id"], cat["shopId"], cat["name"], cat["imageUrl"], cat["adopted"])
        end

    end

    # insert cat info into cat info table

    def insert_into_cat(id, shopId, name, imageUrl, adopted)
        cats = "INSERT INTO cats_info (id, shopId, name, imageUrl, adopted) VALUES AT ($1, $2, $3, $4, $5)"

        result = @db.exec_params(dog, [id, shopId, name, imageUrl, adopted])
        result.entries
    end

  # show pet shops 

    def show_pet_shops
    shops = @db.exec("SELECT * FROM shops")
    puts "ID | Name"
    puts "-----------------------------"
    shops.each do |shop|
      puts "#{shop['id']} -- #{shop['name']}"
    end
  end

  # show certain dogs in the shops 
 
  def show_dogs_for_shop(shop_id)
    shop = @db.exec("SELECT * FROM shops WHERE id=$1", [shop_id])
    shop.entries 
    end
  end
 
 # show happiest dogs 

  def show_dogs_order_by_happiness
    dogs = @db.exec("SELECT * FROM dogs ORDER BY happiness DESC")
 
    puts "Happiest Dogs:"
    dogs.each do |dog|
      puts "#{dog['name']} - #{dog['happiness']}"
    end
  end


end
