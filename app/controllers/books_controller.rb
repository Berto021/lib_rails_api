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

  def change_status
    book = Book.find(params[:id])
    if book.update(status: params[:status])
      render json: book
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def only_reading
    books = Book.where(status: :reading)
    render json: books
  end

  def percent_of_read_books
    books = Book.where(status: :read)
    total_books = Book.count
    percent = total_books > 0 ? (books.count.to_f / total_books * 100).round(2) : 0
    render json: { percent_of_read_books: percent }
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end


