class ApplicationController < Sinatra::Base
    # all other controllers will inherit from this parent controller
    # the way that our controllers communicate with views is through instance vaiables
    # order of routes is important

    # configure block to set path to views 
    configure do 
        #sessions will be set and security
        #set :public_folder, 'public'
        set :views, 'app/views'
    end


    # define general routes that dont involve a model
    # route route '/'
    get '/' do
        erb :welcome
    end 

end    