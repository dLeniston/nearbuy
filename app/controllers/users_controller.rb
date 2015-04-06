 class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

      def show
        @user = User.find(params[:id])
        @microposts = @user.microposts
        @store = @user.store
      end

       def new
        @user = User.new
      end

   def create
        @user = User.new(secure_params)
        if @user.save
          sign_in @user
        	flash[:success] = "Welcome to NearBuy!"
           redirect_to @user
        else
             render 'new'    
        end
      end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        flash[:success] = "Details updated"
        redirect_to @user
      else
        render 'edit'
      end
  end

  def logged_in_user
    unless signed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
      end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

        private
        def secure_params
          params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        end

end
