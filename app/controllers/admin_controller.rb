class AdminController < Devise::RegistrationsController
  before_action :authorize_admin, only: [:create, :index, :new, :dashboard]
  skip_before_action :require_no_authentication, only: [:new, :create]
  before_action :set_user, only: [:show, :destroy]

  def dashboard
  end

  def index
    @user = User.order("first_name").page(params[:page])
  end

  def show
  end

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      redirect_to admin_path
    else
      render :new, notice: "Invalid Entry"
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_path, notice: "User Deleted Successfully"
  end


  private
  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admin Only!'
  end

  def set_user
    @user = User.find(params[:id])
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin)
  end
end
