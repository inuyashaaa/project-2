class UsersController < ApplicationController
  load_and_authorize_resource only: [:index, :destroy]
  before_action :load_user, except: [:index, :new, :create]

  def index
    user_selects = User.select(:id, :name, :email, :phone, :is_admin).order_by_id
    @users = user_selects.page(params[:page]).per Settings.users.per_page
  end

  def show
    list_post = @user.posts.select(:id, :title, :content, :picture, :created_at, :user_id).created_at_desc
    @posts = list_post.page(params[:page]).per Settings.posts.per_page
  end

  def destroy
    @user.destroy ? (flash[:success] = t ".deleted") : (flash[:error] = t ".error")
    redirect_to users_url
  end

  private

  def load_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:error] = t ".error"
    redirect_to root_path
  end
end
