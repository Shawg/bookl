require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'creates book' do
  	expect { create(:user_with_books) }.to change {Book.count}.by(1)
  end

  it 'creates post' do
  	expect { create(:book) }.to change {Post.count}.by(1)
  end

  it 'creates author' do
  	expect { create(:book, :with_authors) }.to change {Author.count}.by(1)
  end

  it 'creates course' do
	  expect { create(:book, :with_courses) }.to change {Course.count}.by(1)
	end

	it 'creates multiple authors' do
  	expect { create(:book, :with_authors, authors_count: 3) }.to change {Author.count}.by(3)
  end

  it 'creates multiple courses' do
  	expect { create(:book, :with_courses, courses_count: 3) }.to change {Course.count}.by(3)
  end

  it 'destroys post' do
  	user = create(:book)
	  expect { user.destroy }.to change {Post.count}.by(-1)
	end

	it 'destroys author' do
		book = create(:book, :with_authors)
	  expect { book.destroy }.to change {Author.count}.by(-1)
	end

	it 'destroys multiple authors' do
		book = create(:book, :with_authors, authors_count: 4)
	  expect { book.destroy }.to change {Author.count}.by(-4)
	end

	it 'destroys course' do
		book = create(:book, :with_courses)
	  expect { book.destroy }.to change {Course.count}.by(-1)
	end

	it 'destroys multiple courses' do
		book = create(:book, :with_courses, courses_count: 4)
	  expect { book.destroy }.to change {Course.count}.by(-4)
	end

end