class AdminController < ApplicationController
  def create_user
  end

  def create_group
     @group = group.new
  end

  def create_proj
    @project = project.new 
  end
end
