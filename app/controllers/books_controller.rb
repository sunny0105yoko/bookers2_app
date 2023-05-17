class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
      redirect_to book_path(@book.id)
      else
      render :new
      end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) 
    @book_v= Book.new
  end

  def edit
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
