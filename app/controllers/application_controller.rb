class ApplicationController < Sinatra::Base
    # controllers communicate with views is through instance vaiables
    # define general routes that dont involve a model
    # order of routes is important

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        set :sessions, true
        set :session_secret, ENV["SESSION_SECRET"] 
        register Sinatra::Flash
    end

    # route route '/'
    get '/' do
        erb :welcome
    end 

    helpers do

        # return the logged in user
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])#memoization
    end

    def logged_in?
     !!session[:user_id]
    end

    end    

end    