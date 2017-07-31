class AdminController < ApplicationController
  before_filter :authorize_admin, only: [:create, :index]
  
  def index
  end
  
  def create_user
  end
  
  private
  
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admin only!'
  end
end
