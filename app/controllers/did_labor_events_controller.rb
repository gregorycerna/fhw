class DidLaborEventsController < ApplicationController
  before_action :set_did_labor_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @did_labor_events = DidLaborEvent.all
    respond_with(@did_labor_events)
  end

  def show
    respond_with(@did_labor_event)
  end

  def new
    @did_labor_event = DidLaborEvent.new
    respond_with(@did_labor_event)
  end

  def edit
  end

  def create
    @did_labor_event = DidLaborEvent.new(did_labor_event_params)
    @did_labor_event.save
    respond_with(@did_labor_event)
  end

  def update
    @did_labor_event.update(did_labor_event_params)
    respond_with(@did_labor_event)
  end

  def destroy
    @did_labor_event.destroy
    respond_with(@did_labor_event)
  end

  private
    def set_did_labor_event
      @did_labor_event = DidLaborEvent.find(params[:id])
    end

    def did_labor_event_params
      params.require(:did_labor_event).permit(:time, :labor_id, :notes)
    end
end
