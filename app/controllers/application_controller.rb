class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_current_user

  def find_current_user
    @current_user =  User.first
  end
end
