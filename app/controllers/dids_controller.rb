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
    @did.labor = Labor.find(params[:labor_id])
    @did.checkoffs = @did.labor.tasks.map do |task|
      Checkoff.new(task_id: task.id)
    end
    respond_with(@did)
  end

  def edit
    @labor = @did.labor
  end

  def create
    @did = Did.new(did_params)
    @did.labor_id = params[:labor_id]
    @did.checkoffs.zip(@did.labor.tasks).each do |chk, tsk|
      chk.task_id = tsk.id
    end
    @did.save
    respond_with(@did)
  end

  def update
    # this is so hacky it's not funny
    @did.with_transaction_returning_status do
      @did.assign_attributes(did_params)
      checks = @did.checkoffs
      len = checks.size
      checks[0...len/2].each_with_index do |chk, tsk|
        chk.complete = checks[len/2+tsk].complete
      end
      checks.delete checks[len/2..len-1]
      @did.save
    end
    respond_with(@did)
  end

  def destroy
    l = @did.labor
    @did.destroy
    redirect_to labor_dids_path(l)
  end

  private
    def set_did
      @did = Did.find(params[:id])
    end

    def did_params
      params.require(:did).permit(:time, :notes, :labor_id, checkoffs_attributes:[:complete])
    end
end
