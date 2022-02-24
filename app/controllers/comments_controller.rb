class CommentsController < ApplicationController
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.artwork = Artwork.find(params[:artwork_id])
    if @comment.save
      redirect_to @comment.artwork, notice: 'Comment saved'
    else
      redirect_to @comment.artwork, notice: 'Invalid comment'
    end
  end

  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:user, :artwork, :body)
  end
end
