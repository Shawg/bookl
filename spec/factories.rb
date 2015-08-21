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
        books_count 2
      end

      after(:create) do |user_account, eval|
        create_list(:book, eval.books_count, user_account: user_account)
      end
    end
  end

  factory :book do
    title { Faker::Book.title }
    volume { rand(0..5) }
    edition { rand(0..5) }
    user_account

    after(:build) do |book|
      post = build(:post, book: book)
      author = build(:author, book: book)
      course = build(:course, book: book)

    end

    trait :with_authors do
      transient do 
        authors_count 2
      end

      after(:create) do |book, eval|
        create_list(:author_book, eval.authors_count, book: book)
      end
    end

    trait :with_courses do
      transient do 
        courses_count 2
      end

      after(:create) do |book, eval|
        create_list(:book_course, eval.courses_count, book: book)
      end
    end

    factory :book_with_authors_and_courses, traits: [:with_authors, :with_courses]
  end

  factory :post do
    price { Faker::Commerce.price }
    description { Faker::Company.bs }
    book
  end

  factory :course do
    department { generate(:dept) }
    course_number { Faker::Number.number(3) }
    book
  end

  factory :author do
    au_fname { Faker::Name.first_name }
    au_lname { Faker::Name.last_name}
    book
  end

  sequence :dept do |n|
    ('A'..'Z').to_a.sample(4).join
  end

end