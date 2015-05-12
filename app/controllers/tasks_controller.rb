class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /tasks
  # GET /tasks.json
  def index
    @to_do = current_user.tasks.where(state: "to_do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
    respond_with(@tasks)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_with(@task)
  end

  # GET /tasks/new
  def new
    @task = Task.new
    respond_with(@tasks)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(task_params)
    @task.save
    respond_with(@task)
   end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.update(task_params)
    respond_with(@task)
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:content, :state)
    end
end
