class CartController < ApplicationController

def add
    @book = Book.find(params[:id])
    @lineacarrito = @cart.add(@book.id, params[:amount])

    respond_to do |format|
      format.html { redirect_to :controller => "catalog" }
      format.js
    end
  end

  def remove
    @book = Book.find(params[:id])
    @lineacarrito = @cart.remove(@book.id, params[:amount])

    respond_to do |format|
      format.html { redirect_to :controller => "catalog" }
      format.js
    end
  end

  def clear
    @cart.cart_items.destroy_all

    respond_to do |format|
      format.html { redirect_to :controller => "catalog" }
      format.js
    end
  end
end
