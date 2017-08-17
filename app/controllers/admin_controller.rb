class AdminController < Devise::RegistrationsController
  before_filter :authorize_admin, only: [:create, :index, :new]
  skip_before_filter :require_no_authentication, only: [:new, :create]
  before_action :set_user, only: [:show, :destroy]
  
  def dashboard
  end
  
  def index
    @user = User.all
  end
  
  def show
  end
  
  def new
    super
  end
  
  def create
    build_resource(sign_up_params)
    if resource.save
      redirect_to admin_dashboard_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    @user.destroy
    redirect_to admin_path, notice: "The user was deleted"
  end
  
  
  private
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admin only!'
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
