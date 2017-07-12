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

  def edit
    @comment = @post.comments.find_by id: params[:id]
    render json: {
      html: render_to_string(partial: "edit_comment", locals: {comment: @comment}),
      status: :success
    }
  end

  def update
    @comment = @post.comments.find_by id: params[:id]
    if @comment.update_attributes comment_params
      render json: {
        html: render_to_string(@comment),
        status: :success,
        id: @comment.id
      }
    else
      render json: {
        status: :error,
        message: :"Can not update comment"
      }
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
