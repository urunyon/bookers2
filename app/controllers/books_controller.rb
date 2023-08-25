class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book sccessfully."
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = current_user
    @book = Book.find(params[:id])
  end

  def update
    @book = User.find(params[:id])
    @book.update(user_params)
    if @book.save
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
