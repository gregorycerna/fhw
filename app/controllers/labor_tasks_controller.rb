class LaborTasksController < ApplicationController
  before_action :set_labor_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @labor_tasks = LaborTask.all
    respond_with(@labor_tasks)
  end

  def show
    respond_with(@labor_task)
  end

  def new
    @labor_task = LaborTask.new
    respond_with(@labor_task)
  end

  def edit
  end

  def create
    @labor_task = LaborTask.new(labor_task_params)
    @labor_task.save
    respond_with(@labor_task)
  end

  def update
    @labor_task.update(labor_task_params)
    respond_with(@labor_task)
  end

  def destroy
    @labor_task.destroy
    respond_with(@labor_task)
  end

  private
    def set_labor_task
      @labor_task = LaborTask.find(params[:id])
    end

    def labor_task_params
      params.require(:labor_task).permit(:description, :complete, :didLaborEvent_id)
    end
end
