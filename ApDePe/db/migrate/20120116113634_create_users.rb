class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, :null => false
      t.string :crypted_password
      t.string :password_salt,       :null => false                # optional, but highly recommended
      t.string :persistence_token,   :null => false                # required
      t.timestamps
    end
    

  end

    def self.down
    drop_table :users
  end 
end
