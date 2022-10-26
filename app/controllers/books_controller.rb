class BooksController < ApplicationController

    # request all the books
    # index route
    get '/books' do
        #binding.pry
        @books = Book.all
        erb :'books/index' #render the index view/file
    end 

    # user just made a request to view form to add a new book
    get '/books/new' do
        @categories = Category.all
        erb :'books/new'
    end 

    # user wants to see details of One book
    # show route
    get '/books/:id' do
        get_books
        erb :'books/show'
    end

    #create new book
    post '/books' do
        #binding.pry
        @book = Book.new(params)
        @book.user_id = session[:user_id]
        #binding.pry
        book_already_exists
        if @book.title.blank?
            flash[:error] = "Error - Please fill in a Title for your new book entry" 
            redirect '/books/new'
        else
            @book.save
            
            redirect '/books'
        end        
    end

    # user just requested to see an edit form for a book
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

    # user wants to delete an existing book
    delete '/books/:id' do
        get_books
        @book.destroy
        redirect '/books'
      
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


    private

    def book_already_exists
        if Book.find_by_title(params[:title]) && Book.find_by_author(params[:author])
            flash[:error] = "This info matches an existing book in your library - Please Enter a New Book"
            redirect '/books/new'
        end  
    end


end
