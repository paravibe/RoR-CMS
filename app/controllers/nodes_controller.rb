class NodesController < ApplicationController
  before_action :is_admin
  before_action :get_users, :only => [:new, :create, :edit, :update]
  before_action :find_title, :only => [:edit, :update, :delete, :destroy]

  def index
    @nodes = Node.sorted
  end

  def new
    @node = Node.new
    @node.build_node_title
  end

  def create
    @node = Node.new(node_params)
    @node.node_title = NodeTitle.new(:title => params[:node][:node_title][:title])

    # Save node.
    if @node.save
      flash[:notice] = "Node #{@node.node_title.title} has been created."
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @node.build_node_title if @node.node_title.nil?
  end

  def update
    if @node.update_attributes(node_params)
      flash[:notice] = "Node #{@node.node_title.title} has been updated."
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
  end

  def destroy
    node = Node.find(params[:id]).destroy
    flash[:notice] = "Node #{node.node_title.title} has been destroyed."
    redirect_to(:action => 'index')
  end

  private

  def node_params
    params.require(:node).permit(
      :user_id,
      :status,
      :image,
      :body,
      node_title_attributes: [:title]
    )
  end

  def get_users
    @users = User.sorted
  end

  def find_title
    @node = Node.find(params[:id])
    @node_title = @node.node_title.nil? ? '' : @node.node_title.title
  end

end
