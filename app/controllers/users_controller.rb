class UsersController < ApplicationController
    
    # sign up '/signup' => will be a NEW route creating a user obj
    get '/signup' do 
        erb :"users/signup"
    end

    post '/signup' do
         #binding.pry
        user = User.new(params)

        if user.username.blank? || user.email.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
           redirect '/signup'
        else
           user.save
           redirect '/books'
        end
    end

    

    
end
