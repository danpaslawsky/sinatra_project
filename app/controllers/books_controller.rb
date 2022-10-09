class BooksController < ApplicationController
    # all routes containing to books model

    # user just requested all the books
    # index route
    get '/books' do
        @books = Book.all
        erb :'books/index' #render the index view/file
    end 

    # user just made a request to view form to add a new book
    get '/books/new' do

        erb :'books/new'
    end    
    
    # order matters when building routes. Get dynamic routes need to be after all other get routes
    # user wants to see details of One book
    # show route
    get '/books/:id' do
        @book = Book.find_by(id:params[:id])
        erb :'books/show'
    end

    post '/books' do
        #create new post
        #redirect user somewhere 
        @book = Book.create(params)
        redirect "/books/#{@book.id}"
    end

    # user just requested to see an edit form for a post
    get '/books/:id/edit' do
        @book = Book.find_by(id:params[:id])
        erb :"/books/edit"

    end

    # user just submitted the edit form
    patch '/books/:id' do
        @book = Book.find_by(id:params[:id])

        @book.update(title: params[:title], author: params[:author], book_genre: params[:book_genre], number_of_pages: params[:number_of_pages], book_review: params[:book_review])
        redirect "/books/#{@book.id}"
        #no view
        # update the particular obj w/ new attribute
    end 

    # user wants to delete an existing post
    delete '/books/:id' do
        @book = Book.find_by(id:params[:id])
        @book.destroy
        redirect '/books'
      #no view
    end

end
