class ProfilesController < ApplicationController
  before_action :confirm_logged_in

  def new
    @profile = Profile.new
    if request.get?
      @user_id = params[:id]
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = 'Profile has been saved.'
      # redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @profile = Profile.find(params[:user_id])
  end

  def update
    @profile = Profile.find(params[:user_id])
    if @profile.update_attributes(profile_params)
      flash[:notice] = 'Profile has been updated.'
      # redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @profile = Profile.find(params[:user_id])
  end

  def destroy
    Profile.find(params[:user_id]).destroy
    flash[:notice] = "Role has been destroyed."
    # redirect_to(:action => 'index')
  end

  private

  def profile_params
    params.require(:profiles).permit(
        :user_id,
        :city,
        :company,
        :social
    )
  end
end
