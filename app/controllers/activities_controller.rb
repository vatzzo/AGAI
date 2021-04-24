class ActivitiesController < ApplicationController
    def index
        @pagy, @activities = pagy(activities, items: 10)
    end

    def show
        activity
    end

    def edit
        activity
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.new(activity_params)
        @activity.user = current_user
        @activity.save

        if @activity.errors.any?
            flash[:alert] = @activity.errors.full_messages
            render :new
        else
            flash[:notice]='New activity has been added.'
            redirect_to activities_path
        end
    end

    def update
        activity.update(activity_params)
        redirect_to activities_path, notice: 'Activity has been updated.'
    end

    def destroy
        activity.destroy
        redirect_to activities_path, notice: 'Activity has been deleted.'
    end

    private

    def activities
        activities = Activity.all.where(user: current_user).order(:deadline)
        if params[:query].nil?
            activities
        else
            activities.where("lower(title) LIKE ?", "%" + params[:query].downcase + "%") unless params[:query].nil?
        end
    end

    def activity
        @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
        params.require(:activity).permit(:title, :description, :image, :deadline, :is_public)
    end
end
