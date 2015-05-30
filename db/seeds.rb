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
Book.destroy_all
Course.destroy_all
Post.destroy_all
BookCourse.destroy_all
AuthorBook.destroy_all

NUM_USER = 20

# creating admin
UserAccount.create(
  email: "admin@email.com",
  isAdmin?: true,
  password: "password",
  password_confirmation: "password"
)

# populating users
(NUM_USER).times do 
  user = UserAccount.create(
    email: "#{Internet.free_email}",
    isAdmin?: false,
    password: "password",
    password_confirmation: "password"
  )

  # populating books
  rand(1..10).times do
    book = Book.create(
      isbn: "#{Code.isbn}",
      volume: "#{App.version}",
      edition: "#{Number.digit}",
      title: "#{App.name}",
      active: rand(2) == 1,
      user_account_id: user.id
    )

    # populating authors
    rand(1..4).times do
      author = Author.create(
        au_lname: "#{Name.first_name}",
        au_fname: "#{Name.last_name}"
      )

      author_book = AuthorBook.create(
        book_id: book.id,
        author_id: author.id
      )
    end  

    # populating courses
    rand(1..4).times do
      course = Course.create(
        department: "#{Commerce.department(3)}",  # max 3 departments 
        course_number: "#{Number.number(4)}"    # max 4 course numbers 
      )

      book_course = BookCourse.create(
        book_id: book.id,
        course_id: course.id
      )
    end

    post = Post.create(
      book_id: book.id,
      price: "#{Commerce.price}",
      description: "#{Lorem.paragraph(5)}"
    )

  end
end
