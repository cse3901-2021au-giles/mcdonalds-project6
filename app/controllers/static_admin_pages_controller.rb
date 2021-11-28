class StaticAdminPagesController < ApplicationController
  def login
  end

  def project
    @admin_projects = Project.all
  end

  def group
    @admin_groups = Group.all 
    @selected_project = Project.find(params[:selected_project])
  end

  def members
    @selected_group = Group.find(params[:selected_group])
  end

  def addStudent
    puts params[:user].inspect
    @user = USer.new(user_params);

    if @user.save
      redirect_to '/admin_static_pages/projectPage.html'
    else
      render 'new'
    end
  end

  def addGroup
    puts params[:group].inspect
    @group = Group.new(groups_parms);

    if @group.save 
      redirect_to '/admin_statuc_pages/projectPage.html'
    else 
      render 'new'
    end
  end 

  def addProject
    puts params[:project].inspect 
    @project = Project.new(project_parms); 


    if @project.save
      redirect_to '/admin_static_pafes/projectPage.html'
    else 
      render 'new'
    end 
  end

  def evaluation
  end

end