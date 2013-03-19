class UpdateActsAsTaggableOnMigration < ActiveRecord::Migration
  def up
	 create_table :books_tags, :id => false do |table|
      table.column :tag_id, :integer, :null => false
      table.column :book_id, :integer, :null => false
     end
  end

end
