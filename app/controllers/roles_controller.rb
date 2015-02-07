class RolesController < ApplicationController

  before_action :confirm_logged_in

  def index
    @roles = Role.sorted
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:notice] = "Role #{@role.name} has been added."
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      flash[:notice] = "Role #{@role.name} has been updated."
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @role = Role.find(params[:id])
  end

  def destroy
    role = Role.find(params[:id]).destroy
    flash[:notice] = "Role #{role.name} has been destroyed."
    redirect_to(:action => 'index')
  end

  private

  def role_params
    params.require(:role).permit(
      :name,
    )
  end
end
