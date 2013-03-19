class Cart < ActiveRecord::Base
  has_many :cart_items, :dependent => :destroy
  has_many :books, :through => :cart_items
  
  def tamano
    cart_items.inject(0) {|sum, n| n.amount + sum}
  end

  def total
    cart_items.inject(0) {|sum, n| n.amount + sum}
  end

  def add(book_id, amount)
    cantidad = Integer(amount)
    items = cart_items.find_all_by_book_id(book_id)
    book = Book.find(book_id)

    if cantidad > 0
      if items.size < 1
        ci = cart_items.create(:book_id => book_id, :amount => cantidad, :price => book.price)
      else
        ci = items.first
        ci.update_attribute(:amount, ci.amount + cantidad)
        ci.update_attribute(:price, ci.price + book.price * cantidad)
      end
      ci
    end
  end

  def remove(book_id, amount)
    cantidad = Integer(amount)
    item = cart_items.find_by_book_id(book_id)
    book = Book.find(book_id)

  if cantidad > 0
      if item.amount - cantidad > 0
        item.update_attribute(:amount, item.amount - cantidad)
        item.update_attribute(:price, item.price - book.price * cantidad)
      else
        CartItem.destroy(item.id)
      end
    end
  end

end
