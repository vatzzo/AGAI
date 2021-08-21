class AdminPanelController < ApplicationController
  def show
    @pagy, @users = pagy(users, items: 20)
  end

  def destroy
    user.destroy
    flash[:notice]='User has been deleted.'
    redirect_to admin_panel_path, status: :ok
  end

  def send_email
    InfoMailer.information_email(content: params[:email_content], subject: params[:email_subject]).deliver_now
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
