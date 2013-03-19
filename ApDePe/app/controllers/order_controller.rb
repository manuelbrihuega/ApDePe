class OrderController < ApplicationController

 before_filter :require_admin

 def index
    @status = params[:id]
    if @status.blank?
        @status = 'all'
        conditions = nil
    else
        conditions = "status = '#{@status}'"
    end
  @orders = Order.paginate(:page => params[:page], :per_page => 10, :order => 'created_at desc')

 end

  def show
   @order = Order.find(params[:id])
  end

  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "El pedido #{order.id} ha sido cerrado"
    redirect_to :action => 'index', :id => 'closed'
  end

end
