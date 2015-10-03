class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :check_for_admin
  protect_from_forgery with: :exception

  def check_for_admin
  	redirect_to '/admin/login' if (!request.fullpath.eql?('/admin/login') and current_admin_user.nil?)
  end
end
