class StaticController < ApplicationController
  before_filter :authorize_admin, only: [:data_entry]
  
  def home
  end
  
  def data_entry
  end
  
  private
  
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admin only!'
  end
end
