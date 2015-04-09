class ProductsController < ApplicationController
		before_filter :signed_in_user, only: [:create, :destroy]
  	before_filter :correct_user, only: :destroy
  	respond_to :html, :json

    def index
      @products = Product.search(params[:search])
    end

    def show
      @user = User.find(params[:id])
        @store = @user.store
        @products = @user.products
    end

    def create
      	 secure_post = params.require(:product).permit(:name, :description, :price,
      	 												:stock)
         @product = current_user.store.products.build(secure_post) 
        	if @product.save()
         	  flash[:success] = "Product Details Added!"
          	  redirect_to root_url
       		else
            render 'static_pages/home'
        	end
      end

   def edit
        @product = Product.find(params[:id])
   end

   def update
        @product = Product.find(params[:id])
        @product.update_attributes(secure_params)
        respond_with @product
    end

    def destroy
      @product.destroy
      redirect_to root_url
    end

    def correct_user
        @product = current_user.products.find_by_id(params[:id])
        redirect_to root_url if @product.nil?
    end

      private
        def secure_params
          params.require(:product).permit(:name, :description, :price,
                                :stock)
        end
end
