class DashboardController < ApplicationController
  def show
    @pagy, @activities = pagy(activities, items: 20)
  end

  private

  def activities
    if params[:query].nil?
        Activity.published.order(:created_at)
    else
        Activity.published.where("lower(title) LIKE ?", "%" + params[:query].downcase + "%")
    end
  end
end
