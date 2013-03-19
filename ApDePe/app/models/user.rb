class User < ActiveRecord::Base
  acts_as_authentic # do |c|
 #   c.login_field = :login
 #   c.validate_password_field = false
#end
  has_many :comments
has_many :topics, :dependent => :destroy
has_many :posts, :dependent => :destroy
  #set_primary_key :login
end

