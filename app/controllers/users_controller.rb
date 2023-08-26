class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
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
    @book_new = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render edit_user_path(@user.id)
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
