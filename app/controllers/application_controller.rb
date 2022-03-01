class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :admin? , :player?
    
  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
  ## Pagination Page Number
  def page
    @page ||= params[:page] || 1
  end
    
  ## Pagination Per Page Records
  def per_page
    @per_page ||= params[:per_page] || 20
  end
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  

  def admin?
      current_user.role = User.where(:role => 'admin')
  end

  def player?
    current_user.role = User.where(:role => 'player')
  end
  
end
