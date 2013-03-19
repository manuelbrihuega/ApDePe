class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user
before_filter :crear_carrito
private 
   def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

   def require_user
      unless current_user
       # store_location
        flash[:notice] = "Debe estar logueado para acceder a esta zona"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        #store_location
        flash[:notice] = "No debe estar logueado para acceder a esta zona"
        redirect_to account_url
        return false
      end
    end

     def require_admin
      unless is_admin?
        #store_location
        flash[:notice] = "Debe ser Administrador para acceder a esta zona"
        redirect_to new_user_session_url
        return false
      end
    end

    #def store_location
    #  session[:return_to] = request.request_uri
    #end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
     def is_admin?
      logged_in? && (current_user.login == "admin" || current_user.login == "Admin")
    end
    def logged_in?
      !!current_user
    end

    def authorized?
      current_user.login == "admin"
    end
    # Metodo Helper para comprobar si un usuario logueado es admin
    helper_method :is_admin?
      def is_admin?
        if logged_in? && (current_user.login == "admin"|| current_user.login == "Admin")
          true
        else
          false
        end
      end


def crear_carrito
	 if session[:cart_id]
        @cart = Cart.find(session[:cart_id])
      else
        @cart = Cart.create()
        session[:cart_id] = @cart.id
      end
end


end
