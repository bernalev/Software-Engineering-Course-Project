class GroupsController < ApplicationController
  def new
  end
  def index
    @groups = Group.all
  end
  def create
  	@group = Group.new(group_params)
 
  	@group.save
  	redirect_to @group
  end
  def update
    # currently called when user clicks join group
    group = Group.find(params[:id])
    group.users << current_user
    group.save
    redirect_to group_path(group)
  end
  def show
    @group = Group.find(params[:id])
    @messages = Message.where("group_id = ? ", params[:id])
  end

  private
    def group_params
      params.require(:group).permit(:name, :course_id)
    end
end
