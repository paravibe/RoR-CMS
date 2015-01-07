class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:admin_user).permit(
        :first_name,
        :last_name,
        :email,
        :username,
        :password
    )
  end
end
