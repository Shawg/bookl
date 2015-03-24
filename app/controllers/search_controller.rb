class SearchController < ApplicationController
	def display
		@results ||= retreive_results
	end

	private

	def retreive_results
		Post.find(:all)
	end

end
