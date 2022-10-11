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
        aleady_user
        if user.username.blank? || user.email.blank? || user.password.blank?
            flash[:error] = "Error - Please fill in all required data" 
            redirect '/signup'
        else
           user.save
           session[:user_id] = user.id #logging user in
           redirect '/login'
        end
    end
    
    # renders login page
    get '/login' do
        #binding.pry
        erb :'/users/login'
    end

    post '/login' do
        #gather data from the form
        #create a new user obj w/ data
        user = User.find_by_username(params[:username])
        #binding.pry
        #if my user exists && pasword is correct
        if user && user.authenticate(params[:password])
       #login user
        session[:user_id] = user.id 
        redirect '/books'
        else
        flash[:error] = "Invalid Username or Password - Please Enter Your User Info Or Sign Up For an Account"
        redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/login'
    end

private

    def aleady_user
        if User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            flash[:error] = "This info matches an existing user, please login or enter different info"
            redirect '/signup'
        end  
    end
    
end
