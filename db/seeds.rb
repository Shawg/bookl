# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Author.destroy_all
Book.destroy_all
Course.destroy_all
Post.destroy_all

NUM_USER = 20

def rand_post
  Post.new(
    price: "#{Faker::Commerce.price}",
    description: "#{Faker::Company.bs}"
  )
end
  
def rand_authors
  # populating authors
  [].tap do |authors|
    rand(1..3).times do
      authors << Author.new(
        au_lname: "#{Faker::Name.first_name}",
        au_fname: "#{Faker::Name.last_name}"
      )
    end 
  end
end
  
def rand_courses
  # populating courses
  [].tap do |courses|
    rand(1..3).times do
      courses << Course.new(
        department: ('a'..'z').to_a.shuffle[0,3].join,  # max 3 letters 
        course_number: "#{Faker::Number.number(3)}"    # max 3 digits 
      )
    end
  end
end

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
    email: "#{Faker::Internet.free_email}",
    isAdmin?: false,
    password: "password",
    password_confirmation: "password"
  )

  # populating books for user
  rand(1..10).times do
    book = Book.create!(
      isbn: "#{Faker::Code.isbn}",
      volume: "#{Faker::App.version}",
      edition: "#{Faker::Number.digit}",
      # title: "#{App.name}",
      title: "#{Faker::Book.title}",
      created_at: "#{Faker::Date.between(30.days.ago, Date.today)}",
      active: rand(2) == 1,
      user_account_id: user.id,
      post: rand_post,
      authors: rand_authors,
      courses: rand_courses
    )
  end
end