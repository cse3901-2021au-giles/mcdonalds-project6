class RegistrationsController < ApplicationController
    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(user_params)
        if @admin.save 
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end

    def  user_params
        params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
    
end
