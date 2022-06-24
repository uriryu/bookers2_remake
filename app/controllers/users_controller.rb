class UsersController < ApplicationController
  def show
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to edit_user_path(@user)
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @users = User.all
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end
