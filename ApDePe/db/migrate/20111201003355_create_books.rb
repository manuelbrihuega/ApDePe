class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, :limit => 255, :null => false
      t.integer :publisher_id
      t.datetime :published_at
      t.string :isbn, :limit => 13, :unique => true
      t.text :blurb
      t.integer :page_count
      t.float :price
      t.timestamp :created_at 
      t.timestamp :updated_at

      t.timestamps
    end
     create_table :authors_books, :id => false do |t|
      t.integer :author_id, :null => false
      t.integer :book_id, :null => false
    end
    #say_with_time 'Adding foreign keys' do
	# Add foreign key reference to publishers table
      #execute 'ALTER TABLE books ADD CONSTRAINT fk_bk_books FOREIGN KEY ( publisher_id ) REFERENCES publishers( id ) ON DELETE CASCADE'
      # Add foreign key reference to books_authors table
      #execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_bk_authors FOREIGN KEY ( author_id ) REFERENCES authors( id ) ON DELETE CASCADE'
      #execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_bk_books FOREIGN KEY ( book_id ) REFERENCES books( id ) ON DELETE CASCADE'
      
    #end
  end
end
