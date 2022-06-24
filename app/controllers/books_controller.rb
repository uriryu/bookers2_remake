class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    # 現在のuser情報を変数に入れる。nameerrorは変数の名前が違うという意味。
    # current_user.id のidはurlの/8などの数字がある時.idが必要になる。
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(current_user)
    else
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to books_path
  end

  def show
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end