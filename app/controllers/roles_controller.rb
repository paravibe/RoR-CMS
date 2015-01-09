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
      flash[:notice] = 'Role added.'
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
      flash[:notice] = 'Role updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @role = Role.find(params[:id])
  end

  def destroy
    Role.find(params[:id]).destroy
    flash[:notice] = "Role destroyed."
    redirect_to(:action => 'index')
  end

  private

  def role_params
    params.require(:role).permit(
        :name,
    )
  end
end
