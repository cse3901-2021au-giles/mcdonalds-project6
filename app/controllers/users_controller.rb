class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    if session[:admin_id]
      @admin = Admin.find_by(id: session[:admin_id])
    end
    @users = User.all
    
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit_e
    
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def new_eval
    @evaluation= Evaluation.new
  end

def create_eval
  if session[:user_id]
    @user = User.find_by(id: session[:user_id])
  end
  @evaluation = Evaluation.new(projects_params)
  if @evaluation.save 
      redirect_to evaluation_path, notice: "Successfully created eval"
  else
    render :new_eval
  end
end

  #GET user/home
  def home
    @user = User.find_by(id: session[:user_id])
    # now using the user found, chain id scan from group to group to every respective project.
    @userGroups = @user.groups
    @projects = []
    @groups = []
    @userGroups.each do |group|
      groupProjects = group.projects
      groupProjects.each do |project|
        @projects.append([project, group])
      end
    end

  end
  
  def index_group
    @user=User.find_by(id: session[:user_id])
    @Usergroup = @user.groups
  end

  def index_eval
    @user = User.find_by(id: session[:user_id])
    @project = Project.find_by(id: params[:pid])
    @evaluations = Evaluation.all 
  end

  def view
    @user = User.find_by(id: session[:user_id])
    @project = Project.find_by(id: params[:pid])
    @evaluations = Evaluation.all 
  end

  def evaluation_params
    params.require(:evaluation).permit(:evaluee,:context, :rating, :commit)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
