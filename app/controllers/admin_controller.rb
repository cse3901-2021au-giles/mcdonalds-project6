class AdminController < ApplicationController

  def create_user
    @user = User.new
  end

  def create_group
  end

  def create_proj
    @project = project.new 
  end
end
