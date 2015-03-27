class Search < ActiveRecord::Base

	has_many :posts
	@where = 0

	def self.posts(search)
		@search = search
		@results = self.conditions_find
	end

	private

	def self.add_prefix
		if @where.nil?
			@where = true
			" WHERE"
		else
			" AND"
		end
	end

	def self.title_conditions
		"%s books.title LIKE '%s'" % [self.add_prefix, @search.title] unless @search.title.blank?
	end

	def self.isbn_conditions
		"%s books.isbn = '%s'" % [self.add_prefix, @search.isbn] unless @search.isbn.blank?
	end

	def self.volume_conditions
		"%s books.volume = '%s'" % [self.add_prefix, @search.volume] unless @search.volume.blank?
	end

	def self.edition_conditions
		"%s books.edition = '%s'" % [self.add_prefix, @search.edition] unless @search.edition.blank?
	end

	def self.first_conditions
		"%s authors.au_fname LIKE '%s'" % [self.add_prefix, @search.au_first] unless @search.au_first.blank?
	end

	def self.last_conditions
		"%s authors.au_lname LIKE '%s'" % [self.add_prefix, @search.au_last] unless @search.au_last.blank?
	end

	def self.course_conditions
		"%s courses.course_number = '%s'" % [self.add_prefix, @search.course] unless @search.course.blank?
	end

	def self.department_conditions
		"%s courses.department LIKE '%s'" % [self.add_prefix, @search.department] unless @search.department.blank?
	end

	def self.conditions_find
		sql = "SELECT DISTINCT books.id, books.title, authors.au_fname, authors.au_lname, posts.description, posts.price
			   FROM posts
			   INNER JOIN books
			   ON posts.book_id = books.id
			   INNER JOIN authors_books
			   ON authors_books.book_id = books.id
			   INNER JOIN authors
			   ON authors_books.author_id = authors.id
			   INNER JOIN books_courses
			   ON books_courses.book_id = books.id
			   INNER JOIN courses
			   ON books_courses.course_id = courses.id"

		unless @search.nil?
			sql.concat(self.title_conditions.to_s).concat(self.isbn_conditions.to_s).concat(self.volume_conditions.to_s)
			   .concat(self.edition_conditions.to_s).concat(self.first_conditions.to_s).concat(self.last_conditions.to_s)
			   .concat(self.course_conditions.to_s).concat(self.department_conditions.to_s)
		end

		Post.find_by_sql(sql)
	end
end

