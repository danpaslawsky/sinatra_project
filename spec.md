Specifications for the Sinatra Assessment - aka Vonderbooks

# Specs:

   X   Use Sinatra to build the app
         - gems are installed
         - application_controller < Sinatra::Base
         - rest of controlers < application_controller

   X  Use ActiveRecord for storing information in a database
         - Gems are installed
         - My Models < from Activerecord, gives me access to database ORM methods
 
   X  Include more than one model class (e.g. User, Post,Category)
         1. book.rb
         2. user.rb
 
   X  Include at least one has_many relationship on your User model (e.g. User has_many Posts)
         1. User has_many :books
 
   X  Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
         1. Book belongs_to :user
 
   X  Include user accounts with unique login attribute (username or email)
         - used an if block in the post '/login' route and used activerecord by using an input type of email to confirm the entry had the .com characteristics.  
 
   X  Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
         - the Books and User objects have all routes needed to process the request and response flows of the app.
 
   X  Ensure that users can't modify content created by other users
         - Data is protected on multiple fronts from both conditional statements and methods provided by the Bcrypt gem.
 
   X  Include user input validations
         - conditional blocks are implemented within the nessesary routes that handle the users input.
 
   BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 
   X  Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
      - The readme file is completed in a seperate file meeting all the requirements stated above.

## Confirm

   X  You have a large number of small Git commits

   X  Your commit messages are meaningful
   
   X  You made the changes in a commit that relate to the commit message
   
   X  You don't include changes in a commit that aren't related to the commit message
