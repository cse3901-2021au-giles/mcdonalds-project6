class RegistrationsController < ApplicationController
    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new({name: params[:admin][:a_name], email: params[:admin][:email], password_digest: params[:admin][:password]})
        if @admin.save 
            redirect_to root_path, notice: "Successfully created account"
        else
            render :new
        end
    end
    
end
