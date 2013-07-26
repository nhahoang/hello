class SessionsController < ApplicationController
  def login
    if request.post?
      username = params[:username]
      password = params[:password]
      user = User.authenticate(username, password)
      if user
        session[:user] = user
        respond_to do |format|
          format.html { redirect_to books_path }
        end
      else
        respond_to do |format|
          format.html{ render layout: false}
        end
      end
    else
      respond_to do |format|
        format.html{ render layout: false}
      end
    end
  end

  def logout
    session[:user] = nil;
      respond_to do |format|
        format.html{ render layout: false}
    end
  end
end
