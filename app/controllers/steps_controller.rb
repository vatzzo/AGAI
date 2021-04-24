class StepsController < ApplicationController
    def new
        @step = Step.new
    end

    def show
        step
    end

    def edit
        step
    end

    def create
        @activity = Activity.find(params[:activity_id])
        @step = @activity.steps.new(step_params)
        @step.save

        if @step.errors.any?
            flash[:alert] = @step.errors.full_messages
            render :new
        else
            flash[:notice]='New step has been added.'
            redirect_to edit_activity_path(@step.activity)
        end
    end

    def update
        step.update(step_params)
        redirect_to edit_activity_path(@step.activity), notice: 'Step has been updated.'
    end

    def destroy
        activity = step.activity
        step.destroy
        redirect_to edit_activity_path(activity), notice:'Step has been deleted.'
    end

    private

    def step
        @step = Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def step_params
        params.require(:step).permit(:title, :content, :short_description, :is_done)
    end
end
