require 'pg'

# short hand solution, did exercise in the terminal before saving as a class. 

# Create the database
# createdb classmates.db
# psql classmates.db
# Create the table 

# CREATE TABLE classmates (
# first_name VARCHAR,
# last_name VARCHAR,
# twitter VARCHAR
# );

# Making a Connection
# Write a method that establishes a connection to your database 
# and returns that connection object. Remember: this is the object 
# on which you will call the method exec in order to send your 
# queries to the database.

db = PG.connect(host: 'localhost', dbname: 'classmates.db')

# Get Some Input
# Write a method to get receive user input that asks for 
# information for each of the columns you created in your 
# classmates table.

result = db.exec("insert into classmates values('jessica', 'meyer', '@atxglutenfree')")

# Expand
# Now that you can enter information at the command line and have 
# it inserted into your table it is time to build out some more functionality. 
# Examples of things you might want to do from the command line:

# View all records

all_classmates = db.exec("SELECT * FROM classmates")

all_classmates.entries 
# => [{"first_name"=>"jessica", "last_name"=>"meyer", "twitter"=>"@atxglutenfree"}]

# Delete a particular record

result = db.exec("insert into classmates values('george', 'smith', '@georgesmith')")

db.exec("delete from classmates where first_name='george' ")
all_classmates = db.exec("SELECT * FROM classmates")
all_classmates.entries 

# Update a particular record

db.exec("update classmates set last_name='meyer votaw' where last_name='meyer'")
all_classmates = db.exec("select * from classmates")
all_classmates.entries
# => [{"first_name"=>"jessica", "last_name"=>"meyer votaw", "twitter"=>"@atxglutenfree"}]






