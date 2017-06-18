class OrderModelsController < ApplicationController
  before_action :set_order_model, only: [:show, :edit, :update, :destroy]

  # GET /order_models
  # GET /order_models.json
  def index
    @order_models = OrderModel.all
  end

  # GET /order_models/1
  # GET /order_models/1.json
  def show
  end

  # GET /order_models/new
  def new
    @order_model = OrderModel.new
  end

  # GET /order_models/1/edit
  def edit
  end

  # POST /order_models
  # POST /order_models.json
  def create
    @order_model = OrderModel.new(order_model_params)

    respond_to do |format|
      if @order_model.save
        format.html { redirect_to @order_model, notice: 'Order model was successfully created.' }
        format.json { render :show, status: :created, location: @order_model }
      else
        format.html { render :new }
        format.json { render json: @order_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_models/1
  # PATCH/PUT /order_models/1.json
  def update
    respond_to do |format|
      if @order_model.update(order_model_params)
        format.html { redirect_to @order_model, notice: 'Order model was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_model }
      else
        format.html { render :edit }
        format.json { render json: @order_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_models/1
  # DELETE /order_models/1.json
  def destroy
    @order_model.destroy
    respond_to do |format|
      format.html { redirect_to order_models_url, notice: 'Order model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_model
      @order_model = OrderModel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_model_params
      params.require(:order_model).permit(:order_id, :model_id)
    end
end
