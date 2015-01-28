class LaborsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_labor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @labors = Labor.all
    @violations = Violation.all
    @unsettled, @settled = @violations.partition {|v| v.date_settled.nil? }
    respond_with(@labors)
  end

  def show
    @task = Task.new
    respond_with(@labor)
  end

  def new
    @labor = Labor.new
    respond_with(@labor)
  end

  def edit
  end

  def create
    @labor = Labor.new(labor_params)
    @labor.save
    respond_with(@labor)
  end

  def update
    @labor.update(labor_params)
    respond_with(@labor)
  end

  def destroy
    @labor.destroy
    respond_with(@labor)
  end

  private
    def set_labor
      @labor = Labor.find(params[:id])
    end

    def labor_params
      if params.has_key?(:labor) && params[:labor].has_key?(:dueday)
        params[:labor][:dueday] = Date::DAYNAMES[params[:labor][:dueday].to_i]
      end
      params.require(:labor).permit(:name, :description, :user_id, :dueday)
    end
end
