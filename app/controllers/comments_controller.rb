class CommentsController < ApplicationController
  def create
  	@comunication=Comunication.find(params[:comunication_id])
  	@comment=@comunication.comments.create(comments_params)
  	@comment.save
  	CommentMailer.comment_created(current_user,@comunication.user,@comment.content).deliver
  	redirect_to comunication_path(@comunication)
  end

  private

  def comments_params
  	params.require(:comment).permit(:content)
  end

end
