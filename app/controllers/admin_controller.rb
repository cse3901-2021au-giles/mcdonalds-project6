class AdminController < ApplicationController

  def new_user
    @user = User.new
    @users = User.all
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

end
