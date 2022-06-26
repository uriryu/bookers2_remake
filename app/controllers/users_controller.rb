class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]
  def show
    @users = User.all
    @user = User.find(params[:id])
    # :idには文字列や数字なんでも入る。
    @book = @user.books
    @books = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @books = Book.new
    @user = current_user
    @users = User.all
    @book = Book.all
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
     unless @user == current_user
    redirect_to(current_user) 
     end
  end
  
end