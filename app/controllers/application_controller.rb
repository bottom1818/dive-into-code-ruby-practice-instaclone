class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  #変数PERMISSIBLE_ATTRIBUTESに配列[:name]を代入
  PERMISSIBLE_ATTRIBUTES = %i(name image image_cache)

  protected

  #deviseのストロングパラメーターにカラム追加するメソッドを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
  end
end