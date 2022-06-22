class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    # 現在のuser情報を変数に入れる。nameerrorは変数の名前が違うという意味。
    # current_user.id のidはurlの/8などの数字がある時.idが必要になる。
  end

  def show
  end

  def edit
  end
end
