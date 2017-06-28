class Admin::ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  def index
    @model = Model.find(params[:model_id])
    @service = @model.services.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @model = Model.find(params[:model_id])
    @service = @model.services.find(params[:id])
  end

  def new
    @model = Model.find(params[:model_id])
    @service = @model.services.new

  end

  def update
    @model = Model.find(params[:model_id])
    @service = @model.services.find(params[:id])
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_model_path(@model), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @model = Model.find(params[:service][:model_id])
    @service = @model.services.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_model_path(@model), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :price, :model_id)
    end

end
