class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def cleate
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
  
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
