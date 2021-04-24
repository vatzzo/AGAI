class DashboardController < ApplicationController
  def show
    @pagy, @activities = pagy(activities, items: 10)
  end

  private

  def activities
    if params[:query].nil?
        Activity.where(is_public: true).order(:created_at)
    else
        Activity.where("lower(title) LIKE ?", "%" + params[:query].downcase + "%")
    end
  end
end
