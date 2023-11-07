class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    # redirect_to book_path(book.id)
    # 非同期通信化のためリダイレクト先を削除
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
    @comment.destroy
    # BookComment.find(params[:id]).destroy　←なんだっけこれ
    # redirect_to book_path(book)
    # 非同期通信化のためリダイレクト先を削除
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
