class UsersController < ApplicationController

  before_action :is_admin, :except => [:login, :attempt_login, :logout]

  def index
    @users = User.sorted
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.name} has been created."
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
    if (@user.profile.nil?)
      @user.build_profile
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Data for #{@user.name} user has been updated."
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User #{user.name} has been destroyed."
    redirect_to(:action => 'index')
  end

  def login
    if is_logged_in
      # redirect_to(:action => 'index')
    end
  end

  def attempt_login
    if params[:email].present? && params[:password].present? &&
      found_user = User.where(:email => params[:email]).first
      authorized_user = found_user.authenticate(params[:password])
      if authorized_user
        # mark user as logged in
        session[:user_id] = authorized_user.id
        session[:email] = authorized_user.email
        flash[:notice] = "You are now logged in."
        redirect_to root_path
      else
        flash[:alert] = "Invalid username or password."
        redirect_to(:action => 'login')
      end
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:email] = nil
    redirect_to(:use_route => 'root')
  end

  private

  def user_params
    params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        {
          role_ids:[]
        },
        profile_attributes: [
          :id,
          :user_id,
          :city,
          :company,
          :github,
          :drupal,
          :linkedin,
          :_destroy
        ]
    )
  end

end
