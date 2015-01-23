class DidsController < ApplicationController
  before_action :set_did, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dids = Did.all
    respond_with(@dids)
  end

  def show
    respond_with(@did)
  end

  def new
    @did = Did.new
    @labor = Labor.find(params[:labor_id])
    @did.checkoffs = @labor.tasks.map do |task|
      Checkoff.new(task_id: task.id)
    end
    respond_with(@did)
  end

  def edit
  end

  def create
    @did = Did.new(did_params)
    @did.labor_id = params[:labor_id]
    @did.save
    respond_with(@did)
  end

  def update
    @did.update(did_params)
    respond_with(@did)
  end

  def destroy
    @did.destroy
    respond_with(@did)
  end

  private
    def set_did
      @did = Did.find(params[:id])
    end

    def did_params
      params.require(:did).permit(:time, :notes, :labor_id)
    end
end
