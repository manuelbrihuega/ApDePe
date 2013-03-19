require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_failing_create
    book = Book.new
    assert_equal false, book.save
  end
  fixtures :authors, :publishers, :books, :authors_books
  def test_create
    book = Book.new(
      :title => 'Ruby for Toddlers',
      :publisher_id => Publisher.find(1).id,
      :published_at => Time.now,
      :authors => Author.find(:all),
      :isbn => '123-123-123-1',
      :blurb => 'The best book',
      :page_count => 12,
      :price => 40.4
    )
    assert book.save
  end
  def test_has_many_and_belongs_to_mapping
    apress = Publisher.find_by_name("UCA")
    assert_equal 2, apress.books.size
    book = Book.new(
      :title => 'Rails E-Commerce 3nd Edition',
      :authors => [Author.find_by_first_name_and_last_name('Manuel', 'Brihuega'),
      Author.find_by_first_name_and_last_name('Jose', 'Aparicio')],
      :published_at => Time.now,
      :isbn => '123-123-123-x',
      :blurb => 'E-Commerce on Rails',
      :page_count => 300,
      :price => 30.5
    )
    apress.books << book
    apress.reload
    book.reload
    assert_equal 3, apress.books.size
    assert_equal 'UCA', book.publisher.name
  end
  def test_has_and_belongs_to_many_authors_mapping
    book = Book.new(
      :title => 'Rails E-Commerce 3nd Edition',
      :publisher => Publisher.find_by_name('UCA'),
      :authors => [Author.find_by_first_name_and_last_name('Manuel', 'Brihuega'),
      Author.find_by_first_name_and_last_name('Jose', 'Aparicio')],
      :published_at => Time.now,
      :isbn => '123-123-123-x',
      :blurb => 'E-Commerce on Rails',
      :page_count => 300,
      :price => 30.5
    )
    assert book.save
    book.reload
    assert_equal 2, book.authors.size
    assert_equal 1, Author.find_by_first_name_and_last_name('Manuel', 'Brihuega').books.size
  end
end
