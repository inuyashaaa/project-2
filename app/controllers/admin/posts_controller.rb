class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  layout "admin"

  def index
    @posts = Post.page(params[:page]).per 15
  end

  def destroy
    @post = Post.find_by id: params[:id]

    if @post.destroy
      respond_to do |format|
        format.html do
          redirect_to root_url
        end
        format.js
      end
    else
      flash[:danger] = "Cant not deleted!"
      redirect_to root_url
    end
  end
end
