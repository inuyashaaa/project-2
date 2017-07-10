class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_post, except: [:index, :new, :create]

  def index
    @posts = current_user.posts.select_post.created_at_desc.page(params[:page]).per Settings.posts.per_page
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".created"
      redirect_to @post
    else
      flash[:error] = t ".error"
      render :new
    end
  end

  def show; end

  def edit
    render json: {
      html: render_to_string(partial: "edit_form", locals: {post: @post}),
      status: :success
    }
  end

  def update
    if @post.update_attributes post_params
      render json: {
        html: render_to_string(@post),
        status: :success,
        id: @post.id
      }
    else
      render json: {status: :error}
    end
  end

  def destroy
    if @post.destroy
      render json: {status: :success, post: @post.id}
    else
      render json: {status: :error}
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :picture
  end

  def load_post
    @post = Post.find_by id: params[:id]

    return if @post
    flash[:error] = t ".error"
    redirect_to root_path
  end
end
