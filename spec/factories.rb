require 'faker'

FactoryGirl.define do

  factory :user_account, aliases: [:user] do
    email { Faker::Internet.email }
    password  "password"
    password_confirmation "password"
    factory :admin do
      admin true
    end

    factory :user_with_books do
      transient do 
        books_count 1
      end

      after(:create) do |user_account, eval|
        create_list(:book, eval.books_count, user_account: user_account)
      end
    end
  end

  factory :book do
    title { Faker::App.name }
    volume { rand(0..5) }
    edition { rand(0..5) }
    isbn { Faker::Code.isbn }
    user_account

    after(:build) do |book|
      post = build(:post, book: book)
    end

    trait :with_authors do
      transient do 
        authors_count 1
      end

      after(:create) do |book, eval|
        create_list(:author_book, eval.authors_count, book: book)
      end
    end

    trait :with_courses do
      transient do 
        courses_count 1
      end

      after(:create) do |book, eval|
        create_list(:book_course, eval.courses_count, book: book)
      end
    end

    factory :book_with_authors_and_courses, traits: [:with_authors, :with_courses]
  end

  factory :post do
    price { Faker::Commerce.price }
    description { Faker::Lorem.paragraph(2) }
    book
  end

  factory :course do
    department { generate(:dept) }
    course_number { Faker::Number.number(3) }
  end

  factory :author do
    au_fname { Faker::Name.first_name }
    au_lname { Faker::Name.last_name}
  end

  factory :author_book do
    author
    book
  end

  factory :book_course do
    course
    book
  end

  sequence :dept do |n|
    ('A'..'Z').to_a.sample(4).join
  end

end