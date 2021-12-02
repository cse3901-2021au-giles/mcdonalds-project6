class AdminController < ApplicationController

  def index
  end

  def index_group
    @groups = Group.all
  end

  def index_project
  end

  # all user controller functions
  def new_user # for when you first open the page
    @user = User.new
    @users = User.all
  end

  def create_user # for when admin creates another user using forms 
    @user = User.new(user_params)
    if @user.save 
      @users = User.all # reinstantiate users such that it can update page 
      render :new_user, notice: "Successfully created account"
    else
      render :new_user
    end
  end

  def delete_user

  end

  def  user_params
    params.require(:user).permit(:name, :email, :password)
  end

  # all group controller functions for creating and managing groups.
  def new_group
      @groups = Group.all
      @group= Group.new
  end

  def create_group
      @group = Group.new(group_params)
      if @group.save 
          redirect_to group_home_url, notice: "Successfully created group"
      else
          render :new_group
      end
  end

  def destroy
      @group = Group.find(params[:id])
      @group.destroy
      flash[:success] = "The group was successfully destroyed."
      redirect_to group_home_url
  end

  def  group_params
      params.require(:group).permit(:groupname)
  end

  
  def new_proj
        @projects= Project.new
  end

  def create_proj
      @projects = Project.new(projects_params)
      if @projects.save 
          redirect_to root_path, notice: "Successfully created project"
      else
        render :new_proj
      end
  end

  def  projects_params
      params.require(:project).permit(:projectname, :projecttype, :deadline, :commit)
  end

  

end
