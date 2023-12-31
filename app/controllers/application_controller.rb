class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def add_like
    @like = Like.new(user: @user, post: @post)
    nil unless @like.save
  end

  helper_method :current_user

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
