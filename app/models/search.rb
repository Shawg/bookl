class Search < ActiveRecord::Base
	def posts
		@posts ||= find_posts
	end

	def find_posts
		Post.find(:all)
	# 	Book.find_by_sql ["SELECT title, au_lname, au_fname
	# 					   FROM books B, authors A, courses C
	# 					   WHERE A.au_lname = :au_lname AND A.au_fname = :au_fname AND
	# 					   		 B.title", { :user_id => user_id }]
	end
end