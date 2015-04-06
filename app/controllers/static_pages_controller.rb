class StaticPagesController < ApplicationController

 def home
    if signed_in?
      @micropost  = current_user.microposts.build
      #@store = current_user.build_store
      @feed_items = current_user.feed
    end
 end

  def help
  end

  def about   
  end

  def contact
  end
end
