class GroupsController < ApplicationController
  def new
  end
  def index
    @groups = Group.all
  end
  def create
  	@group = Group.new(params.require(:group).permit(:name))
 
  	@group.save
  	redirect_to @group
  end

  def show
    @group = Group.find(params[:id])
  end
end
