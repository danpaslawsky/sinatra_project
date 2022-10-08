class BooksController < ApplicationController
    #all routes containing to books model

    #our user just requested all the books
    # index route
    get '/posts' do
      #params = {"id"=>"1"}
      @books = Book.all
      erb :'books/index' #render the index view/file
    end 

    # our user wants to see details of One book
    # show route
    get '/posts/:id' do
      #binding.pry
      @book = Book.find(params[:id])

      erb :'books/show'
    end

    


end
