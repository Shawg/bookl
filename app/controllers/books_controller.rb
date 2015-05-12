class BooksController < ApplicationController
before_action :set_book, only: [:show, :edit, :update, :destroy]
respond_to :html

  # GET /books
  # GET /books.json
  def index
    @search = Book.search(params[:q])
    @books = @search.result(:distinct=>true).includes(:post, :authors).page(params[:page]).per(10)
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
    if params[:add_author]
      @author_books = @book.author_books.build
      @author = @author_books.build_author
    elsif params[:add_course]
      @book_courses = @book.book_courses.build
      @course = @book_courses.build_course
    elsif params[:remove_selected]
      # automatically deleted by rails
    else
      respond_to do |format|
        if @book.save
          flash[:notice] = "Successfully created recipe."
          redirect_to @book and return
        end
      end
    end
    render :action => 'new'
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if params[:add_author]
      # rebuild the authors w/o an id
      unless params[:book][:author_books_attributes][:author_attributes].blank?
        for attribute in params[:book][:author_books_attributes][:author_attributes]
          @book.author_books.build.build_author(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
        end
      end
      # add one more empty author attribute
      @book.author_books.build.build_author
    elsif params[:remove_author]
      # collect all marked for delete ingredients ids
      removed_authors = params[:book][:author_books_attributes][:author_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # delete from db
      Author.delete(removed_authors)
      flash[:notice] = "Authors removed."
      for attribute in params[:book][:author_books_attributes][:author_attributes]
        # rebuild authors attributes that doesn't have an id and its _destroy attribute is not 1
        @book.author_books.build.build_author(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
    else
      if @book.update_attributes(params[:book])
        flash[:notice] = "Successfully updated book."
        redirect_to @book and return
      end
    end
    render :action => 'edit'
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'book was successfully destroyed.' }
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
      params.require(:book).permit(:isbn, :title, :volume, :edition,
        post_attributes: [:price, :description, :user_account_id, :book_id],
        author_books_attributes: [author_attributes: [:au_fname, :au_lname, :_destroy]],
        book_courses_attributes: [course_attributes: [:department, :course_number, :_destroy]])
    end
end
