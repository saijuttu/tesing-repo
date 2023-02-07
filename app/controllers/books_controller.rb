class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book Created"
    else
      render('new')
    end
  end


  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book Edited"
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params[:id])
    
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book Destroyed"
  end


  private

  def book_params
    params.require(:book).permit(
      :title, 
      :author, 
      :price, 
      :published_date
    )
  end
end
