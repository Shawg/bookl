# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

Author.destroy_all
Availability.destroy_all
Book.destroy_all
Course.destroy_all
Message.destroy_all
Post.destroy_all
Post.destroy_all

100.times do 

	# Author
	author = Author.create(
		:au_lname => "#{Name.first_name}",
		:au_fname => "#{Name.last_name}"
		)
	
	puts author.inspect

	# Availability 
	availability = Availability.create(
		:day => "#{Faker::Time.between(2.days.ago, Time.now)}",            # weird time stuff going on but should be fine
		:startTime => "#{Faker::Time.between(2.days.ago, Time.now)}",
		:endTime => "#{Faker::Time.forward(23, :all)}",
		:location => "#{Address.street_address}"
		)
	
	puts availability.inspect 

	# Book
	book = Book.create(
		:ISBN => "#{Code.isbn}",
		:volume => "#{App.version}",
		:edition => "#{Number.digit}",
		:title => "#{App.name}"
		)
	
	puts book.inspect

	# Course
	course = Course.create(
		:department => "#{Commerce.department(3)}",  # max 3 departments 
		:courseNumber => "#{Number.number(4)}"		# max 4 departments 
		)
	
	puts course.inspect

	# Message
	message = Message.create(
		:content => "#{Lorem.paragraph(5)}"		# max 5 sentances
		)
	
	puts message.inspect
	
	# Post
	post = Post.create(
		:price => "#{Commerce.price}",
		:description => "#{Lorem.paragraph(5)}"
		)
	
	puts post.inspect	

	# User

	admin = %w(true false)

	user = UserAccount.create(    #syntax????? 
		:email => "#{Internet.free_email}",
		:isAdmin? => admin[ rand(admin.length)],
		:password => "password",
		:password_confirmation => "password"
		)
	
	puts user.inspect


end

