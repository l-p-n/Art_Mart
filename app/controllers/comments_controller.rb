class CommentsController < ApplicationController
  def new
    @artwork = Artwork.find(params[:artwork_id])
    @comment = Comment.new
  end

  def create
    @artwork = Artwork.find(params[:artwork_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.artwork = @artwork
    if @comment.save
      redirect_to artwork_path(@artwork, anchor: "comment-#{@comment.id}")
    else
      redirect_to @comment.artwork, notice: 'Invalid comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @artwork = @comment.artwork
    @comment.destroy
    redirect_to artwork_path(@artwork, anchor: "new-comment-container")
  end


  private

  def comment_params
    params.require(:comment).permit(:user, :artwork, :body)
  end

end
