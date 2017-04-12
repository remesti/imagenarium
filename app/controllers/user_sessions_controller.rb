class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_url
    else
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to login_path
  end

end
