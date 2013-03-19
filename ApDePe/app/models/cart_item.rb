class CartItem < ActiveRecord::Base
	#Relación con el carrito
	belongs_to :cart
	#Relación con el libro
	belongs_to :book
  
def total
    cart.cart_items.inject(0) {|sum, n| n.amount + sum}
  end

  validates :amount, :presence => true, :numericality => { :greather_than_or_equal_to => 1 }
end
