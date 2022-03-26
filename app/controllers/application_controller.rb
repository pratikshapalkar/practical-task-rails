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
  def datatable_page
    params[:start].to_i / datatable_per_page + 1
  end

  ## Returns Datatable Per Page Length Count
  def datatable_per_page
    params[:length].to_i > 0 ? params[:length].to_i : 10
  end

  ## Returns Datatable Sorting Direction
  def datatable_sort_direction
    params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
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
