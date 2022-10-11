class BooksController < ApplicationController
    # <a href="/books">Books</a>
    
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
        get_books
        erb :'books/show'
    end

    #create new post
    post '/books' do
        @book = Book.new(params)
        @book.user_id = session[:user_id]
        @book.save
        redirect "/books/#{@book.id}"
    end

    # user just requested to see an edit form for a post
    get '/books/:id/edit' do
        get_books
        redirect_if_not_authorized
        erb :"/books/edit"
    end

    # user just submitted the edit form
    patch '/books/:id' do
        get_books
        redirect_if_not_authorized
        @book.update(title: params[:title], author: params[:author], book_genre: params[:book_genre], number_of_pages: params[:number_of_pages], book_review: params[:book_review])
        redirect "/books/#{@book.id}"
    end 

    # user wants to delete an existing post
    delete '/books/:id' do
        get_books
        @book.destroy
        redirect '/books'
      #no view
    end

private

    def get_books
        @book = Book.find_by(id:params[:id])
    end

    def redirect_if_not_authorized
        if @book.user != current_user
            flash[:error] = "You can't make this edit, you are not the owner of this account"
            redirect '/books'
        end    
    end

end
