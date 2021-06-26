class AdminPanelController < ApplicationController
  def show
    @pagy, @users = pagy(users, items: 20)
  end

  def destroy
    user.destroy
    redirect_to admin_panel_path
  end

  private

  def users
    User.all
  end

  def user
    @user = User.find(params[:id])
  end
end
