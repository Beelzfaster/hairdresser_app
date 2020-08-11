class HomeController < ApplicationController
  before_action :set_breadcrumbs

  def set_cookie
    cookies.permanent.signed[:user_name] = "Gary"
    cookies.permanent.signed[:user_number] = "01"
  end

  def show_cookie
    @user_name = cookies[:user_name]
    @user_number = cookies[:user_number]
  end

  def delete_cookie
    cookies.delete :user_name
    cookies.delete :user_number
  end
  
  def ping
  end

  def pong
  end

  def index
  end

  def reset
    reset_session
    @breadcrumbs = nil
  end

  private
  def set_breadcrumbs
    if session[:breadcrumbs]
      @breadcrumbs = session[:breadcrumbs]
    else
      @breadcrumbs = Array.new
    end

    @breadcrumbs.push(request.url)

    if @breadcrumbs.count > 4
      @breadcrumbs.shift
    end

    session[:breadcrumbs] = @breadcrumbs

  end
end
