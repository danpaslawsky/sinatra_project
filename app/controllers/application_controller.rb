class ApplicationController < Sinatra::Base
    #all other controllers will inherit from this parent controller

    #configure block to set path to views 
    configure do 
        #sessions will be set and security
        #set :public_folder, 'public'
        set :views, 'app/views'
    end

# order of routes is important
    #define general routes that dont involve a model
    #route route '/'
    get '/' do
        "welcome"
    end 


end    