class SearchsController < ApplicationController
  def index
    if params[:search].present?
      @posts = Post.search(params[:search])
      render json: {
        status: :success,
        html: render_to_string(partial: "post_search", locals: {posts: @posts})
      }
    else
      render json: {
        status: :error,
        message: "Sorry...."
      }
    end
  end
end
