class SessionController < ApplicationController
  def create
    if params[:username] && params[:password]
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:logged_in_userid] = user.id
        redirect_to "/todoitems"      
      else
        redirect_to "/todoitems"
      end
    end    
  end

  def delete
  end
end
