class NodesController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_title, :except => [:index, :new, :create]

  def index
    @nodes = Node.sorted
  end

  def new
    @node = Node.new
    @node.build_node_title
    @users = User.all
  end

  def create
    @node = Node.new(node_params)
    @node.node_title = NodeTitle.new(:title => params[:node][:node_title][:title])
    @users = User.all
    if @node.save
      flash[:notice] = 'Node has been created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @node.build_node_title if @node.node_title.nil?
    @users = User.all
  end

  def update
    @users = User.all
    if @node.update_attributes(node_params)
      flash[:notice] = 'Node has been updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
  end

  def destroy
    Node.find(params[:id]).destroy
    flash[:notice] = 'Node has been destroyed.'
    redirect_to(:action => 'index')
  end

  private

  def node_params
    params.require(:node).permit(
        :user_id,
        :status,
        node_title_attributes: [:node_id, :title]
    )
  end

  def find_title
    @node = Node.find(params[:id])
    @node_title = @node.node_title.nil? ? '' : @node.node_title.title
  end

end
