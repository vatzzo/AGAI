class ProfilesController < ApplicationController
  def show
    profile
  end

  private

  def profile
    @profile = User.find(params[:id])
  end
end
