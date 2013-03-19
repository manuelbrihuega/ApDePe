class CreateComments < ActiveRecord::Migration
def self.up
    create_table :comments do |t|
      t.column :body, :text
      t.column :user_id, :integer
      t.column :book_id, :integer, :null => false
      t.column :created_at, :timestamp
    end

end



  def self.down
    drop_table :comments
  end
end
