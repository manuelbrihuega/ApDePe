class Book < ActiveRecord::Base
    acts_as_taggable_on :tags
    #Relación con los autores del libro
    has_and_belongs_to_many :authors  
    #Relación con el editor
    belongs_to :publisher 
    #Relación con los objetos del carrito 1:N 
    has_many :cart_items
    #Relación con los carritos 1:N
    has_many :carts, :through => :cart_items
    #Relación con la foto de la portada 
    has_attached_file :photo, :styles => { :thumb=> "100x100#", :small  => "150x150>" }, :default_url => "/system/photos/default.jpg"
    #Relación con los comentarios
    has_many :comments
    #para búsqueda
    def publisher_name
	return publisher.name
    end

    def author_names
	self.authors.map do |a|
	a.name
	end.join(", ") rescue ""
    end

    searchable do
	text :title, :default_boost => 3
	text :publisher_name
	text :author_names
    end

    #latest
    def self.latest
        find :all, :limit => 2, :order => "books.id desc"
    end

    #Validaciones
    #validates_attachment_presence :photo , :message => "Debe introducir una imagen"
    validates_attachment_content_type :photo,  :content_type => ['image/jpeg', 'image/png', 'image/gif']
    validates_attachment_size :photo, :greater_than => 1.kilobyte, :smaller_than => 1.megabyte
    validates_length_of :title, :in => 1..255  
    validates_presence_of :publisher_id    
    validates_presence_of :published_at  
    validates_numericality_of :page_count, :only_integer => true  
    validates_numericality_of :price  
    validates :isbn, :format => { :with => /[0-9\-a-zA-Z]{13}/ }
    validates :isbn, :uniqueness => true
end
