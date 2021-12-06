class EvaluationsController < ApplicationController 
    #For a page to list all evaluations ( GET) 
    # Named route: evaluations_path 
    def index
        @evaluations = Evaluation.all 
    end 

    #For a page to show evaluation (GET)
    #Named route: evaluation_path(evaluation)
    def show 
        @evaluation = Evaluation.find(params[:id])
    end 

    #For a page to make a new evaluation (GET)
    #Named route: evaluations_path
    def new 
        @evaluations = Evaluation.new 
    end

    #To create a new evaluation (POST)
    #Named route: evaluation path 
    def create 

        @project = Project.find_by(id: params[:pid]) # find respective project for all the evaluations
        @projectGroups = @project.groups
        @projectGroups.each do |group|  # basically go through chain of associations to create all respective evaluations between users.
            groupUsers = group.users
            groupUsers.each do |sendUser|
                groupUsers.each do |receiveUser|
                    @evaluation = Evaluation.create(evaluee: receiveUser.name, context: "blank context", rating: 0, senderid: sendUser.id, receiverid: receiveUser.id, pid: @project.id)
                    if @evaluation.save!
                    else
                        flash[:alert] = "Error Unable to Assign Evaluations!"
                        @project.update(assigned: 0)
                    end
                end
            end
        end
        @project.update(assigned: 1) # update boolean to show that evaluations have been assigned
        redirect_to projects_path # go back to project screen with an updated view.
    end

    def view
        @evaluations = [] # super inefficient right now, will need to figure out a good way to assign foreign key indexing from proj to evals
        @project = Project.find_by(id: params[:pid]) # find respective project for all the evaluations
        @projectGroups = @project.groups
        @projectGroups.each do |group|  # basically go through chain of associations to create all respective evaluations between users.
            groupUsers = group.users
            groupUsers.each do |sendUser|
                groupUsers.each do |receiveUser|
                    evaluation = Evaluation.find_by(senderid: sendUser.id, receiverid: receiveUser.id, pid: @project.id)
                    evalData = [sendUser.name, receiveUser.name, evaluation.rating, evaluation.context]
                    @evaluations.append(evalData)
                end
            end
        end
    end
    #For a page to edit evaluation with specific id number(GET)
    # Name route: edit evaluation_path(evaluation)
    def edit 
        @evaluations = Evaluation.find(params[:id])
    end 

    #To update an evaluation (PATCH)
    #Named route: evaluation_path(evaluation)
    def patch 
    end 

    #Delete an evaluation 
    def remove
        @project = Project.find_by(id: params[:pid]) # find respective project for all the evaluations
        @projectGroups = @project.groups
        @projectGroups.each do |group|  # basically go through chain of associations to create all respective evaluations between users.
            groupUsers = group.users
            groupUsers.each do |sendUser|
                groupUsers.each do |receiveUser|
                    evaluation = Evaluation.find_by(senderid: sendUser.id, receiverid: receiveUser.id, pid: @project.id)
                    evaluation.destroy
                end
            end
        end
        @project.update(assigned: 0) # update boolean to show that evaluations have been assigned
        redirect_to projects_path(pid: @project.id) # go back to project screen with an updated view.
    end

    def update 
        @evaluation = Evaluation.find(params[:id])

        if @evaluation.update_attributes(evaluation_params)
            redirect_to :action =>'show', :id =>@evaluation
        else
            render :action => 'edit'
        end
    end 


    #authorization check points
    def evaluation_params
        params.require(:evalution).permit(:evaluee, :context, :rating,:senderid, :receiverid,:pid)
    end
end
