class CommentsController < ApplicationController
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.artwork = @artwork
    if @comment.save
      redirect_to @artwork, notice: 'Comment saved'
    else
      redirect_to @artwork, notice: 'Invalid comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :artwork, :body)
  end
end
