class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    
    if current_user.id != @user.id
      redirect_to root_path 
    end
  end

  def edit
  	@user = User.find(params[:id])
    
    if current_user.id != @user.id
      redirect_to root_path 
    end
  end

  def update
	  @user = User.find(params[:id])
    
    if current_user.id != @user.id
      redirect_to root_path 
      return
    end
    
    if (params[:add_course])
      course = Course.find(params[:add_course])

      @user.courses << course
      @user.save

      @school = course.school
      render "schools/show"
	  elsif (params[:rm_course])
      course = Course.find(params[:rm_course])

      @user.courses.delete(course)
      @user.save
      redirect_to root_path
    else  
	    if @user.update(user_params)
        if current_user.sign_in_count == 1 
          redirect_to root_path
        else
	       redirect_to @user
        end
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
