class SearchesController < ApplicationController
	before_action :set_search, only: [:show]

	def new
		@search = Search.new
		@results = Search.posts(@search)
	end

	def create
		@search = Search.new(search_params)
		if @search.save
			@results = Search.posts(@search)
			flash[:notice] = "search was successfully saved"
			render :partial => 'results', :object => @results
		else
			render :action => 'new'
		end
	end

	def show
		@results = Search.posts(@search)
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
