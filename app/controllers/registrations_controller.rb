class RegistrationsController < ApplicationController
    def new
        @admin = Admin.new
    end

    def create
        render plain: params[:admin]
    end
    
end
