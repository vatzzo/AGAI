class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:content], user: current_user,
                           commentable_id: params[:commentable_id], 
                           commentable_type: params[:commentable_type])
    @comment.save

    if @comment.errors.any?
      flash[:alert] = @comment.errors.full_messages
      redirect_to request.referrer
    else
      redirect_to request.referrer, notice: "Comment has been added.", status: :created
    end
  end

  def destroy
    comment.destroy
    redirect_to request.referrer, notice: "Comment has been deleted.", status: :ok
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end
end
