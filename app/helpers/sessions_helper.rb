module SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

      def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user  
      end

      def signed_in?
        !current_user.nil?
      end

      def signed_in_user
        unless signed_in?
          flash[:notice] = "Please sign in"
          redirect_to signin_url
        end
      end 

      def sign_out
        cookies.delete(:remember_token)
        self.current_user = nil
      end

      def current_user=(user)
        @current_user = user
      end

      def current_user
        if @current_user.nil?
           @current_user = 
               User.find_by_remember_token(cookies[:remember_token]) 
        end
        @current_user
      end

      def current_user?(user)
        user == current_user
      end

      def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
      end

      def store_location
      session[:forwarding_url] = request.url if request.get?
      end
      
    end