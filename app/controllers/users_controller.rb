class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
	  @user = User.find(params[:id])
    
    if (params[:add_course])
      course = Course.find(params[:add_course])

      @user.courses << course
      @user.save
	  elsif (params[:rm_course])
      course = Course.find(params[:rm_course])

      @user.courses.delete(course)
      @user.save
      render 'show'
    else  
	    if @user.update(user_params)
	      redirect_to @user
  	  else
	      render 'edit'
      end
    
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
