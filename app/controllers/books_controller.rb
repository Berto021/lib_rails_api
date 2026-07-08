class BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      puts(books.errors.full_messages)
      render json: { errors: book.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    books = Book.all
    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end

  def update
    book = Book.find(params[:id])
    puts "ENTROU NO UPDATE"
    debugger

    if book.update(book_params)
      render json: book
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    book  = Book.find(params[:id])
    book.destroy
    
    head :no_content
  end
  
end

def book_params
    params.require(:book).permit(:title, :author)
end

