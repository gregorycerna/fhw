class MaintenanceRequestsController < ApplicationController
  before_action :set_maintenance_request, only: [:show, :edit, :update, :destroy, :finish, :unfinish]

  respond_to :html

  def index
    @maintenance_requests = MaintenanceRequest.not_dones
    respond_with(@maintenance_requests)
  end

  def dones
    @maintenance_requests = MaintenanceRequest.dones
    respond_with(@maintenance_requests)
  end

  def show
    respond_with(@maintenance_request)
  end

  def new
    @maintenance_request = MaintenanceRequest.new
    respond_with(@maintenance_request)
  end

  def edit
  end

  def create
    @maintenance_request = MaintenanceRequest.new(maintenance_request_params)
    @maintenance_request.user = current_user
    @maintenance_request.save
    respond_with(@maintenance_request)
  end

  def update
    @maintenance_request.update(maintenance_request_params)
    respond_with(@maintenance_request)
  end

  def destroy
    @maintenance_request.destroy
    respond_with(@maintenance_request)
  end

  def finish
    @maintenance_request.update_attribute :done, true
    redirect_to maintenance_requests_path
  end

  def unfinish
    @maintenance_request.update_attribute :done, false
    redirect_to maintenance_requests_path
  end

  private
    def set_maintenance_request
      @maintenance_request = MaintenanceRequest.find(params[:id])
    end

    def maintenance_request_params
      params.require(:maintenance_request).permit(:name, :user_id, :description, :done)
    end
end
