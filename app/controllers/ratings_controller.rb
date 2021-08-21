class RatingsController < ApplicationController
  def create
    if rating
      rating.update(grade: params[:grade].to_f)
      redirect_to request.referrer, notice: "Rating has been updated.", status: :ok
    else 
      @rating = Rating.new(
        grade: params[:grade],
        user: current_user,
        ratingable_id: params[:ratingable_id],
        ratingable_type: params[:ratingable_type]
      )
      
      @rating.save

      if @rating.errors.any?
        flash[:alert] = @rating.errors.full_messages
        redirect_to request.referrer, status: :bad_request
      else
        redirect_to request.referrer, notice: "Rating has been added.", status: :created
      end
    end
  end

  private

  def rating
    options = {
      user: current_user,
      ratingable_type: params[:ratingable_type],
      ratingable_id: params[:ratingable_id]
    }

    @rating ||= Rating.find_by(**options)
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
