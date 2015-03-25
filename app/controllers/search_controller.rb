class SearchController < ApplicationController
	before_action :set_search, only: [:show]

	def new
		@search = Search.new
	end

	def create
		@search = Search.new(search_params)

		respond_to do |format|
			if @search.save
				format.html { redirect_to @search, notice: 'search was successfully created.' }
			else
				format.html { render :new, notice: 'search was not successfully created.' }
			end
		end
	end

	def show
	end

	private

	def set_search
		@search = Search.find(params[:id])
    end

	def search_params
		params.require(:search).permit(:title, :isbn, :volume, :edition,
			:au_first, :au_last, :course, :department)
	end

end
