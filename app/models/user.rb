class User < ActiveRecord::Base
    has_many :books
    #returns an array
end
