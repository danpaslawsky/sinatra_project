class ApplicationController < Sinatra::Base
    
    #configure block to set path to views in which all other controllers will inherit from
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
    end

# order of routes is important

    #route route '/'
    get '/' do
        erb :welcome_page
    end
end    