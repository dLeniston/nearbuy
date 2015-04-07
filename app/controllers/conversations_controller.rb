class ConversationsController < ApplicationController
def index
  sleep 1 #development only, simulates wait time
  respond_to do |format|
    format.html #for my controller, i wanted it to be JS only
    format.js
  end
end