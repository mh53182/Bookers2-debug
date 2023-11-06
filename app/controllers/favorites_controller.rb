class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    # redirect_to request.referer
    # 非同期通信化のためリダイレクトの記述を削除
    # "render"や"redirect_to"の記述がない場合、自動で.js.erbを探しに行く
    # ＝リダイレクト先が無いからJavaScriptリクエストになる
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    # redirect_to request.referer
  end

end
