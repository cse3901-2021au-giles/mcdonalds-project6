class UserController < ApplicationController
  def group
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def proj
  end

  def eval
  end
end
