class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @books =@user.books
    @book = Book.new
  end
  
  def index
    @users =User.all
    @book = Book.new
  end
  
  def edit
    @user =User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private
  
  def user_params
    #params.require(:user).permit(:name, :email, :password)
    params.require(:user).permit(:name, :book, :profile_image, :introduction)
  end

  def is matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end
  end
end