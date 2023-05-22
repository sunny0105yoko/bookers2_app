class UsersController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

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
    @user = User.find(params[:id])
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
end