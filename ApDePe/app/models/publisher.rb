class Publisher < ActiveRecord::Base
	has_many :books
	validates :name, :presence => true
	validates :name, :length => { :minimum => 2 }
	validates :name, :length => { :maximum => 255}
	validates :name, :uniqueness => true
end
