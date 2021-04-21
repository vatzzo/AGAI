class DashboardController < ApplicationController
  def show
    @activities = Activity.all.order(:created_at)
  end
end
