class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    @labor = Labor.find(params[:labor_id])
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.labor = Labor.find(params[:labor_id])
    @task.save
    respond_with(@task.labor)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    l = @task.labor
    @task.destroy
    respond_with(@task.labor)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :labor_id)
    end
end
