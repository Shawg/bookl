class Search < ActiveRecord::Base
	def results
		@results ||= retreive_results
	end

	def retreive_results
		Book.find_by_sql ["SELECT title, au_lname, au_fname
						   FROM books B, authors A, courses C
						   WHERE A.au_lname = :au_lname AND A.au_fname = :au_fname AND
						   		 B.title", { :user_id => user_id }]

	end
end