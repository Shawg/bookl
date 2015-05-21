module SearchHelper
	def model_fields
	    # which fields to display and sort by
	    [:title, :edition, :volume, :authors, :post]
	end

	def display_query_sql(results)
		"SQL: #{results.to_sql}"
	end

	def action
		action_name == 'advanced_search' ? :post : :get
	end

	def display_sort_column_headers(search)
		model_fields.each_with_object('') do |field, string|
			if field == :post
				field = :post_price
			end
			string << content_tag(:th, sort_link(search, field, {}, method: action))
		end
	end

	def display_search_results(objects)
		objects.each_with_object('') do |object, string|
			string << content_tag(:tr, display_search_results_row(object))
		end
	end

	def display_search_results_row(object)
		model_fields.each_with_object('') do |field, string|
			if field == :post
				string << content_tag(:td, object.post.price)
			elsif field == :authors
				authors = object.author_books.collect{|author_book|
					author = Author.find_by_id(author_book.author_id)
					author.au_fname + " " + author.au_lname
				}
				string << content_tag(:td, authors.to_s.gsub(/[^0-9A-Za-z, ]/, ''))
			else 
				string << content_tag(:td, object.send(field))
			end
		end
		.html_safe
	end
end
