class CommentsController < ApplicationController
  def create
    @comment = Comment.new(content: params[:content], user: current_user,
                           commentable_id: subject.id, commentable_type: subject.class)
    @comment.save

    if @comment.errors.any?
      flash[:alert] = @comment.errors.full_messages
      redirect_to request.referrer
    else
      redirect_to request.referrer, notice: "Comment has been added."
    end
  end

  def destroy
    comment.destroy
    redirect_to request.referrer, notice: "Comment has been deleted."
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def subject
    subject = params[:commentable_type].constantize
    @subject = subject.find(params[:commentable_id])
  end
end
