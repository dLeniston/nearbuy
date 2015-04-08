class StoresController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy
  respond_to :html, :json

    def create
      	 secure_post = params.require(:store).permit(:name, :address, :regno, :vatno,
      	 												:opening, :latitude, :longitude)
         @store = current_user.build_store(secure_post) 
        	if @store.save()
         	  flash[:success] = "Store Details Added!"
          	  redirect_to root_url
       		else
            render 'static_pages/home'
        	end
      end

      def edit
        @store = Store.find(params[:id])
      end

      def update
        @store = Store.find(params[:id])
        @store.update_attributes(secure_params)
        respond_with @store
      end

    def destroy
      @store.destroy
      redirect_to root_url
    end

    def correct_user
        @store = current_user.stores.find_by_id(params[:id])
        redirect_to root_url if @store.nil?
    end

            private
        def secure_params
          params.require(:store).permit(:name, :address, :regno, :vatno,
                                :opening, :latitude, :longitude)
        end
end