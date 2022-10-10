class UsersController < ApplicationController
    
    # sign up '/signup' => will be a NEW route creating a user obj
    get '/signup' do 
        erb :"users/signup"
    end

    post '/signup' do
         #binding.pry
         #no need to make this instance variable because it is not being rendered to view page
         #instance variables is how controllers share information with views 
        user = User.new(params)

        if user.username.blank? || user.email.blank? || user.password.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
           redirect '/signup'
        else
           user.save
           session[:user_id] = user.id #logging user in
           redirect '/books'
        end
    end
    # renders login page
    get '/login' do
        erb :'/users/login'
    end

    post '/login' do
    #gather data from the form
    #create a new user obj w/ data
    user = User.find_by_username(params[:username])
    binding.pry
    #if my user exists && pasword is correct
    if user && user.authenticate(params[:password])
       #login user
       session[:user_id] = user.id 
       #redirect
       redirect '/books'
    #else
    
        #invalid login
        #redirect to '/login'

    end

    
end
