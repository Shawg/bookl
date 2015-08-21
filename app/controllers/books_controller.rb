class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  respond_to :html, :js

  PAGESIZE = 15

  def set_search
    if params[:query].nil? or params[:query] == ""
      @search = Book.ransack(params[:q])
      @results = @search.result.includes(:post, :authors, :courses).page(params[:page]).per(PAGESIZE)
    else
      params[:combinator] = 'or'
      params[:groupings] = []
      custom_words = params[:query]
      custom_words.split(' ').each_with_index do |word, index|
        params[:groupings][index] = {title_or_authors_au_fname_or_authors_au_lname_or_courses_department_cont: word}
      end
      @search = Book.joins(:authors, :courses).ransack(params)
      unless (params[:q].nil?)
        @search.sorts = params[:q]['s']
      end
      @results = @search.result(:distinct=>true).includes(:post, :authors, :courses).page(params[:page]).per(PAGESIZE)
    end
  end

  def index
  end


  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
    @post = @book.build_post
    @author = @book.authors.build
    @course = @book.courses.build
  end

  # GET /books/1/edit
  def edit
    @author = @book.authors.build
    @course = @book.courses.build
  end

  # book /books
  # book /books.json
  def create
    @book = Book.new(book_params) 
    respond_to do |format|
      if @book.save
        flash[:success] = "Successfully created book."
        redirect_to @book and return
      else 
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
        flash[:success] = "Successfully updated book."
        redirect_to @book and return
    end
    render :action => 'edit'
  end

  def repost
    @book = Book.find(params[:id])
    @book.update_attributes active: true
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
      params.require(:book).permit(:id, :isbn, :title, :volume, :edition, :user_account_id, 
        post_attributes: [:id, :price, :description, :book_id],
        authors_attributes: [:id, :au_fname, :au_lname, :_destroy],
        courses_attributes: [:id, :department, :course_number, :_destroy])
    end
end
