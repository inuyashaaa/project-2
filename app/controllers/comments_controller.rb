class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id

    if @post.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error}
    end
  end

  def destroy
    @comment = @post.comments.find_by id: params[:id]
    @comment.destroy
    respond_to do |format|
      format.html do
        redirect_to @post
      end
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def find_post
    @post = Post.find_by id: params[:post_id]
  end
end
