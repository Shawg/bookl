class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
respond_to :html

  def index
  end

  # GET /books/1
  # GET /books/1.json
  def show
    # @book = set_book
  end

  # GET /books/new
  def new
    @book = Book.new
    @post = @book.build_post
    @author_books = @book.author_books.build
    @author = @author_books.build_author
    @book_courses = @book.book_courses.build
    @course = @book_courses.build_course
  end

  # GET /books/1/edit
  def edit
  end

  # book /books
  # book /books.json
  def create
    @book = Book.new(book_params) 
    if params[:add_author] || params[:add_course] || params[:remove_selected]
      if params[:add_author]
        @author_books = @book.author_books.build
        @author = @author_books.build_author
      end
      if params[:add_course]
        @book_courses = @book.book_courses.build
        @course = @book_courses.build_course
      end
      if params[:destroy_auth]
        AuthorBook.destroy_all(author_id: params[:destroy_auth][:id])
      end

      respond_to do |format|
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        if @book.save
          flash[:success] = "Successfully created book."
          redirect_to current_user_account and return
        else 
          format.html { render :new }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if params[:add_author]
      # rebuild the authors w/o an id
      unless params[:book][:author_books_attributes].blank?
        unless params[:book][:author_books_attributes][:author_attributes].blank?
          for attribute in params[:book][:author_books_attributes][:author_attributes]
            @book.author_books.build.build_author(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
          end
        end
      end
      # add one more empty author attribute
      @book.author_books.build.build_author
    elsif params[:add_course]
      # rebuild the courses w/o an id
      unless params[:book][:book_courses_attributes].blank?
        unless params[:book][:book_courses_attributes][:course_attributes].blank?
          for attribute in params[:book][:book_courses_attributes][:course_attributes]
            @book.book_courses.build.build_course(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
          end
        end
      end
      # add one more empty course attribute
      @book.book_courses.build.build_course
    elsif @book.update_attributes(book_params)
        flash[:success] = "Successfully updated book."
        redirect_to @book and return
    end
    render :action => 'edit'
  end

  def repost
    @book = Book.find(params[:id])
    @book.update_attributes active: !@book.active
    redirect_to user_account_path(current_user_account)
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      flash[:success] = "Book has been destroyed"
      format.html { redirect_to user_account_path(current_user_account)}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :volume, :edition, :user_account_id, 
        post_attributes: [:price, :description, :book_id],
        author_books_attributes: [:id, :_destroy, author_attributes: [:id, :au_fname, :au_lname, :_destroy]],
        book_courses_attributes: [:id, :_destroy, course_attributes: [:id, :department, :course_number, :_destroy]])
    end
end
