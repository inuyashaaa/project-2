class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  load_and_authorize_resource
  layout "admin"

  def index
    @users = User.select(:id, :name, :email, :avatar, :phone).order_by_name
      .page(params[:page]).per 10
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      respond_to do |format|
        format.html do
          flash[:success] = "User deleted!"
          redirect_to admin_root_path
        end
        format.js
      end
    else
      flash.now[:alert] = t ".delete_failed"
      redirect_to admin_root_path
    end
  end
end
