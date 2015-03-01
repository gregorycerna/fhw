class ViolationsController < ApplicationController
  before_action :set_violation, only: [:show, :edit, :update, :destroy, :settle, :unsettle]

  respond_to :html

  def index
    # @violations = Violation.all
    # @unsettled, @settled = @violations.partition { |v| v.date_settled.nil?}
    redirect_to labors_path
  end

  def show
    respond_with(@violation)
  end

  def new
    @violation = Violation.new
    @violation.labor = Labor.find(params[:labor_id])
    respond_with(@violation)
  end

  def edit
  end

  def create
    @violation = Violation.new(violation_params)
    @violation.labor_id = params[:labor_id]
    @violation.save
    redirect_to labors_path
  end

  def update
    @violation.update(violation_params)
    redirect_to labors_path
  end

  def destroy
    @violation.destroy
    redirect_to labors_path
  end

  def settle
    @violation.update_attribute :date_settled, DateTime.now
    redirect_to labors_path
  end

  def unsettle
    @violation.update_attribute :date_settled, nil
    redirect_to labors_path
  end

  private
    def set_violation
      @violation = Violation.find(params[:id])
    end

    def violation_params
      params.require(:violation).permit(:description, :labor_id, :amount_due, :date_settled)
    end
end
