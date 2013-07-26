class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required, except: :login
  before_filter :set_locale

  def login_required
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user = (User.find(session[:user].id) if session[:user]) || false
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
  
end
