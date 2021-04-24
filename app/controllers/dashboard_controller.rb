class DashboardController < ApplicationController
  def show
    activities
  end

  private

  def activities
    if params[:query].nil?
        @activities = Activity.where(is_public: true).order(:created_at)
    else
        @activities = Activity.where("lower(title) LIKE ?", "%" + params[:query].downcase + "%")
    end
  end
end
