class BooksController < ApplicationController
    #all routes containing to books model

    #our user just requested all the books
    # index route
    get '/books' do
      #params = {"id"=>"1"}
        @books = Book.all
        erb :'books/index' #render the index view/file
    end 

    # my user just made a request to view form to add a new book
    get '/books/new' do
        erb :'books/new'
    end    
    
    # our user wants to see details of One book
    # show route
    get '/books/:id' do
        @book = Book.find(params[:id])
        erb :'books/show'
    end

end
