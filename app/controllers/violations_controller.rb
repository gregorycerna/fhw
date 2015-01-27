class ViolationsController < ApplicationController
  before_action :set_violation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @violations = Violation.all
    respond_with(@violations)
  end

  def show
    respond_with(@violation)
  end

  def new
    @violation = Violation.new
    respond_with(@violation)
  end

  def edit
  end

  def create
    @violation = Violation.new(violation_params)
    @violation.save
    respond_with(@violation)
  end

  def update
    @violation.update(violation_params)
    respond_with(@violation)
  end

  def destroy
    @violation.destroy
    respond_with(@violation)
  end

  private
    def set_violation
      @violation = Violation.find(params[:id])
    end

    def violation_params
      params.require(:violation).permit(:description, :labor_id, :amount_due, :date_settled)
    end
end
