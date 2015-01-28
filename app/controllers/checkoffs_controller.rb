class CheckoffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checkoff, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @checkoffs = Checkoff.all
    respond_with(@checkoffs)
  end

  def show
    respond_with(@checkoff)
  end

  def new
    @checkoff = Checkoff.new
    respond_with(@checkoff)
  end

  def edit
  end

  def create
    @checkoff = Checkoff.new(checkoff_params)
    @checkoff.save
    respond_with(@checkoff)
  end

  def update
    @checkoff.update(checkoff_params)
    respond_with(@checkoff)
  end

  def destroy
    @checkoff.destroy
    respond_with(@checkoff)
  end

  private
    def set_checkoff
      @checkoff = Checkoff.find(params[:id])
    end

    def checkoff_params
      params.require(:checkoff).permit(:task_id, :did_id, :complete)
    end
end
