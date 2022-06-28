class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def index
    @books = Book.new
    @book = Book.all
    @user = current_user

    # 現在のuser情報を変数に入れる。nameerrorは変数の名前が違うという意味。
    # current_user.id のidはurlの/8などの数字がある時.idが必要になる。
  end

  def create
    @user = current_user
    @book = Book.all
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if @books.save
      redirect_to book_path(@books.id), notice: 'You have created book successfully.'
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
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
    # ここを変えないとログインしているユーザー画像が表示されてしまう。
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: 'You have updated book successfully.'
    else
      render :edit
    end
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