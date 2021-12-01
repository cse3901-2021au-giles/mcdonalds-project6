class AdminController < ApplicationController

  def new_user
    @user = User.new
  end

  def create_group
     @group = group.new
  end

  def create_proj
    @project = project.new 
  end
end
