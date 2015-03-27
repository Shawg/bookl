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
BookCourse.destroy_all
AuthorBook.destroy_all


numUser = 20

UserAccount.create(    #syntax????? 
    :email => "geoff@email.com",
    :isAdmin? => true,
    :password => "password",
    :password_confirmation => "password"
    )

UserAccount.create(    #syntax????? 
    :email => "eli@email.com",
    :isAdmin? => true,
    :password => "password",
    :password_confirmation => "password"
    )
UserAccount.create(    #syntax????? 
    :email => "mike@email.com",
    :isAdmin? => true,
    :password => "password",
    :password_confirmation => "password"
    )


# populating users
numUser.times do 
  admin = %w(true false)
  user = UserAccount.create(    #syntax????? 
    :email => "#{Internet.free_email}",
    :isAdmin? => false,
    :password => "password",
    :password_confirmation => "password"
    )
  puts user.inspect
end

(numUser).times do |n|
  # Populating Books
  book = Book.create(
    :isbn => "#{Code.isbn}",
    :volume => "#{App.version}",
    :edition => "#{Number.digit}",
    :title => "#{App.name}"
  )
  # Author
  author = Author.create(
    :au_lname => "#{Name.first_name}",
    :au_fname => "#{Name.last_name}"
  )
  
  puts author.inspect
  puts book.inspect
end  

(numUser).times do |n|
  # Author_Book
    author_book = AuthorBook.create(
      :book_id => 1 + rand(numUser - 1),
      :author_id => 1 + rand(numUser - 1)
    )
end

(numUser).times do |n|

  # Course
  course = Course.create(
    :department => "#{Commerce.department(3)}",  # max 3 departments 
    :course_number => "#{Number.number(4)}"    # max 4 course numbers 
  )

  # Book_Course
  book_course = BookCourse.create(
    :book_id => 1 + rand(numUser - 1),
    :course_id => course.id
  )

end


# populating posts
(3*numUser).times do |n|
  post = Post.create(
      :book_id => 1+(n%numUser),
      :user_account_id => 1+rand(numUser),
      :price => "#{Commerce.price}",
      :description => "#{Lorem.paragraph(5)}"
    )
  puts post.inspect 
  
  availability = Availability.create(
      :post_id => post.id,
      :day => "#{Faker::Time.between(2.days.ago, Time.now)}",            # weird time stuff going on but should be fine
      :startTime => "#{Faker::Time.between(2.days.ago, Time.now)}",
      :endTime => "#{Faker::Time.forward(23, :all)}",
      :location => "#{Address.street_address}"
  )
  puts availability.inspect 

  message = Message.create(
      :content => "#{Lorem.paragraph(5)}",   # max 5 sentances
      :user_account_id => 4 + (n%numUser),
      :post_id => post.id  
    )
  puts message.inspect
end
