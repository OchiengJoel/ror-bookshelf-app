class BooksController < ApplicationController
    
    def index

        @books = Book.page(params[:page]).per(10)
        
    end

    # def show

    #     @book = Book.find_by(id: params[:id])
    #     if @book.nil?
    #         flash[:error] = "Book not found"
    #         redirect_to books_path
    #     else

    #         render "books/show"
    #     end
    # end

    def new

        @book = Book.new
        
    end    


    def create

        @book = Book.new(book_params)

        if @book.save
            redirect_to books_path
            flash[:notice] = "Added New Book Successfully"

        else  
            render :new, status: :unprocessable_entity  
            
        end
        
    end

    def edit

              
    end

    def update

        @book =Book.find(params[:id])

        if @book.update(book_params)
            redirect_to @book
            
        else

            render :edit, status: :unprocessable_entity
            
        end
            
    end

    private 

    def book_params

        params.require(:book).permit(:title, :author, :description, :reading_status)
        
    end
    
end