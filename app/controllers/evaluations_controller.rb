class EvaluationsController < ApplicationController 
    #For a page to list all evaluations ( GET) 
    # Named route: evaluations_path 
    def index
        @evaluations = Evaluation.all 
    end 

    #For a page to show evaluation (GET)
    #Named route: evaluation_path(evaluation)
    def show 
        @evaluations = Evaluation.find(params [:id])
    end 

    #For a page to make a new evaluation (GET)
    #Named route: evaluations_path
    def new 
        @evaluations = Evaluation.new 
    end

    #To create a new evaluation (POST)
    #Named route: evaluation path 
    def create 
        @evaluations = Evaluation.new(evaluation_params)

        respond_to do |format| 
            if @evaluation.save 
                format.html {redirect_to @evaluation}
                format.json{ render :show, status: :created, location: evaluation}
            else
                format.html {render : new }
                format.json {render json: @evaluation.errors, status: :unprocesssable_entity}
            end
        end
    end

    #For a page to edit evaluation with specific id number(GET)
    # Name route: edit evaluation_path(evaluation)
    def edit 
    end 

    #To update an evaluation (PATCH)
    #Named route: evaluation_path(evaluation)
    def patch 
    end 

    #Delete an evaluation 
    def remove
        @evaluation.remove 
        respond_to do |format| 
            format.html {redirect_to evaluations_url, notice: 'evaluations were removed'}
            format.json {head: no_content}
        end
    end


    #authorization check points
    def evaluation_params
        params.require(:evalution).permit(:u_name, :email, :password)
    end
end
