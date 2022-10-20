class CategoryController < ApplicationController
    
    get '/categories' do
        #binding.pry
        @categories = Category.all
        erb :'categories/index' #render the index view/file
    end 

    get '/categories/new' do
        erb :'books/new'
    end 

    post '/categories' do
        @category = Category.create(params)
        #binding.pry
    end

end