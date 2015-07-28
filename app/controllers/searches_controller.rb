class SearchesController < ApplicationController
	before_action :set_search, only: [:show]
	PAGESIZE = 15

	def index
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

	def new
		@search = Search.new
	end

	def create
	end

	def show
	end

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:title, :isbn, :volume, :edition, :au_last, :au_first, :course, :department)
    end

end
