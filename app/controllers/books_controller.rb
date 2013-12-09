class BooksController < ApplicationController
 helper_method :sort_column, :sort_direction

  def index
    @books = Book.order(sort_column + " " + sort_direction)
    # @books = Book.rank_title_asc
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id

      if @book.save
        redirect_to @book
      else
        render action: "new" 
      end
  end

  def update
    @book = Book.find(params[:id])

      if @book.update_attributes(params[:book])
        redirect_to books_url
      else
        render :action => :edit
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_url 
  end

  private
    def sort_column
     params[:sort] || "rank" 
    end

    def sort_direction
      params[:direction] || "asc"
    end

end
