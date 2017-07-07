class UsersController < ApplicationController
  load_and_authorize_resource only: [:index, :destroy]

  def index
    user_selects = User.select(:id, :name, :email, :phone, :is_admin).order_by_id
    @users = user_selects.page(params[:page]).per Settings.users.per_page
  end

  def destroy
    @user.destroy ? (flash[:success] = t ".deleted") : (flash[:error] = t ".error")
    redirect_to users_url
  end
end
