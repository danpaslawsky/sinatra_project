class ApplicationController < Sinatra::Base
    #all other controllers will inherit from this parent controller

    #configure block to set path to views 
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