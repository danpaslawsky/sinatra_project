class User < ActiveRecord::Base
    #bcrypt will be in here
    
    has_many :books
    #returns an array
    
    #with a has many :____, though: :_____ order of macros matters. 
    #a join table connects them 
end
