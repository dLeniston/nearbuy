class StaticPagesController < ApplicationController

 def home
    if signed_in?
      #@store = current_user.build_store
    end
 end

  def help
  end

  def about   
  end

  def contact
  end
end
