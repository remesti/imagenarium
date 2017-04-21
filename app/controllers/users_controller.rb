class UsersController < ApplicationController

  before_action :set_user, only: %i(edit update destroy)
  before_action :require_login, only: %i(edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to edit_user_url(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :site_language_id,
      :cards_language_id,
      :schichida,
      :doman,
      :math
    )
  end
end
