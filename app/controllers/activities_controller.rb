class ActivitiesController < ApplicationController
    def index
        @activities = current_user.activities
    end

    def show 
        activity
        steps
    end

    def edit
        activity
        steps
        @user = activity.user
    end

    def new
        @activity = Activity.new
    end

    def create 
        @activity = Activity.new(activity_params)
        @activity.user = current_user
        @activity.save

        unless @activity.errors.any?
            flash[:notice]='New activity has been added.' 
            redirect_to activities_path
        else
            flash[:alert] = @activity.errors.full_messages.first
            render :new
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

    def activity
        @activity = Activity.find(params[:id]) 
    end

    def steps
        @steps = Step.where(activity: activity)
    end

    # Only allow a list of trusted parameters through.
    def activity_params
        params.require(:activity).permit(:title, :description)
    end
end
