class CreateUserController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new(user_params)
        if @user.save 
            @users = User.all # reinstantiate users such that it can update page 
            render :new_user, notice: "Successfully created account"
        else
          render :new_user
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "The to-do item was successfully destroyed."
        redirect_to cusers_url
    end
end