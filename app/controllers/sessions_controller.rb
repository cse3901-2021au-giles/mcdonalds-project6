class SessionsController < ApplicationController

  def new 

  end

  def create
    admin = Admin.find_by(email: params[:email])
    if admin.present? && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_home_path, notice: "Logged in as admin successfully"
    else
      user = User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully"
      else
        flash[:alert] = "Invalid email or password"
        render :new
      end
    end
  end
  

  def destroy 
    session[:admin_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
