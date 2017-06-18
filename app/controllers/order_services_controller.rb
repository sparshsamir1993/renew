class OrderServicesController < ApplicationController
  before_action :set_order_service, only: [:show, :edit, :update, :destroy]

  # GET /order_services
  # GET /order_services.json
  def index
    @order_services = OrderService.all
  end

  # GET /order_services/1
  # GET /order_services/1.json
  def show
  end

  # GET /order_services/new
  def new
    @order_service = OrderService.new
  end

  # GET /order_services/1/edit
  def edit
  end

  # POST /order_services
  # POST /order_services.json
  def create
    @order_service = OrderService.new(order_service_params)

    respond_to do |format|
      if @order_service.save
        format.html { redirect_to @order_service, notice: 'Order service was successfully created.' }
        format.json { render :show, status: :created, location: @order_service }
      else
        format.html { render :new }
        format.json { render json: @order_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_services/1
  # PATCH/PUT /order_services/1.json
  def update
    respond_to do |format|
      if @order_service.update(order_service_params)
        format.html { redirect_to @order_service, notice: 'Order service was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_service }
      else
        format.html { render :edit }
        format.json { render json: @order_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_services/1
  # DELETE /order_services/1.json
  def destroy
    @order_service.destroy
    respond_to do |format|
      format.html { redirect_to order_services_url, notice: 'Order service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_service
      @order_service = OrderService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_service_params
      params.require(:order_service).permit(:order_id, :service_id)
    end
end
