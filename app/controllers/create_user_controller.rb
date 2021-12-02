class CreateUserController < ApplicationController

    def index
        if session[:admin_id]
            @admin = Admin.find_by(id: session[:admin_id])
        end
        @users = User.all
        @user = User.new
    end

    def new
        @user = User.new(user_params)
        if @user.save 
            @users = User.all # reinstantiate users such that it can update page 
            render 'create_user/index', notice: "Successfully created account"
        else
          render 'create_user/index'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        else
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "The to-do item was successfully destroyed."
        redirect_to cusers_url
    end

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end