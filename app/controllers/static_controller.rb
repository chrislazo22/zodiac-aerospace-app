class StaticController < ApplicationController
  before_action :authorize_admin, only: [:data_entry]

  def home
  end

  def data_entry
  end

  def instructions
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admin Only!'
  end
end
