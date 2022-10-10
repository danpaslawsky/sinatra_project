class ApplicationController < Sinatra::Base
    # all other controllers will inherit from this parent controller
    # the way that our controllers communicate with views is through instance vaiables
    # order of routes is important

    # configure block to set path to views 
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        set :sessions, true
        set :session_secret, ENV["SESSION_SECRET"] 
        register Sinatra::Flash
    end


    # define general routes that dont involve a model
    # route route '/'
    get '/' do
        erb :welcome
    end 

end    