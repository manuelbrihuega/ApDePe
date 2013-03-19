class CheckoutController < ApplicationController
  #before_filter :crear_carrito
  def index
    @order = Order.new
    # @page_title = "Checkout"
    if @cart.books.empty?
    flash[:notice] = "¡Carrito vacío! Por favor selecciona algún producto antes de proceder a realizar el pedido."
    redirect_to :controller => 'catalog'
    end
  end

  def place_order
      @order = Order.new(params[:order])
      @order.customer_ip = request.remote_ip
      populate_order
      # if @order.save
        if @order.process
          flash[:notice] = 'Su pedido ha sido enviado, en breves momentos será procesado.'
           session[:order_id] = @order.id
      # Empty the cart
          @cart.cart_items.destroy_all
          render :action => 'thank_you'
        else
          flash[:notice] = "Error while placing order.'#{@order.error_message}'"
          render :action => 'index'
        end
     # else
     #   render :action => 'index'
     # end
  end

  def thank_you
  end

private
  def populate_order
    @cart.cart_items.each do |cart_item|
      order_item = OrderItem.new(
        :book_id => cart_item.book_id,
        :price => cart_item.price,
        :amount => cart_item.amount
      )
      @order.order_items << order_item
    end
  end
end
