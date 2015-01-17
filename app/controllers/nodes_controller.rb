class NodesController < ApplicationController
  before_action :confirm_logged_in

  def index
    @nodes = Node.sorted
  end

  def new
    @node = Node.new
    @users = User.all
    @node.build_node_title
  end

  def create
    @node = Node.new(node_params)
    @users = User.all
    if @node.save
      flash[:notice] = 'Node has been created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @node = Node.find(params[:id])
    @users = User.all
  end

  def update
    @node = Node.find(params[:id])
    @users = User.all
    if @node.update_attributes(node_params)
      flash[:notice] = 'Node has been updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @node = Node.find(params[:id])
  end

  def destroy
    Node.find(params[:id]).destroy
    flash[:notice] = "Node destroyed."
    redirect_to(:action => 'index')
  end

  private

  def node_params
    params.require(:node).permit(
        :user_id,
        :status,
        node_title_attributes: [:title]
    )
  end

end
