class StepsController < ApplicationController
    def new
        @step = Step.new
        @activity_id = params[:activity_id]
    end

    def show
        step
    end

    def create
        @step = Step.new(step_params)
        @step.activity_id = activity_id
        @step.save

        unless @step.errors.any?
            flash[:notice]='New step has been added.' 
            redirect_to activity_path(@step.activity)
        else
            flash[:alert] = @activity.errors.full_messages.first
            redirect_to :back
        end
    end 

    def destroy
        activity_id = step.activity_id
        step.destroy
        redirect_to activity_path(activity_id), notice:'Step has been deleted.'
    end
    
    private

    def step
        step = Step.find(params[:id])
    end
    
    def activity_id
        activity_id = params[:activity_id]
    end

    # Only allow a list of trusted parameters through.
    def step_params
        params.require(:step).permit(:title, :content, :activity_id)
    end
end
