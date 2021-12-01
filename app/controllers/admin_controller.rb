class AdminController < ApplicationController

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

  def new_group
      @group= Group.new
  end

  def create_group
      @group = Group.new(group_params)
      if @group.save 
          redirect_to root_path, notice: "Successfully created group"
      else
          render :new
      end
  end

  def  group_params
      params.require(:group).permit(:groupname)
  end

  
  def new_proj
        @proj= Project.new
  end

  def create_group
      @proj = Project.new(group_params)
      if @proj.save 
          redirect_to root_path, notice: "Successfully created project"
      else
          render :new
      end
  end

  def  proj_params
      params.require(:proj).permit(:projectname, :projecttype, :deadline)
  end

  def  user_params
      params.require(:user).permit(:name, :email, :password)
  end

end
