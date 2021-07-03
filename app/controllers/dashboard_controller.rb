class DashboardController < ApplicationController
  def show
    @pagy, @activities = pagy(activities, items: 20)
  end

  private

  def activities
    if params[:query].nil?
        Activity.published.order("#{filter} desc")
    else
        Activity.published.where("lower(title) LIKE ?", "%" + params[:query].downcase + "%")
    end
  end

  def filter
    params[:filter_with].to_sym

  rescue NoMethodError
    'created_at'
  end
end
