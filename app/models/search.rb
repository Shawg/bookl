class Search < ActiveRecord::Base

	has_many :posts

	def self.posts(search)
		@search = search
		@sql = "SELECT DISTINCT books.title 
			   FROM posts
			   INNER JOIN books
			   ON posts.book_id = books.id
			   INNER JOIN authors_books
			   ON authors_books.book_id = books.id"

		@results = self.find_conditions
	end

	def self.find_conditions
		unless @search.title.blank?
			@sql = @sql + " books.title = ?", @search.title
			puts @sql
		end
		self.find_posts
	end



	def self.find_posts 
		Post.find_by_sql(@sql)
	end

end

