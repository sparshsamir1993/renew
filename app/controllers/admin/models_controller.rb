class Admin::ModelsController < ApplicationController
  def index
    @models = Brand.find(params[:id]).models.all
  end

  def show
    @model = Model.find(params[:id])
    @services = @model.services.all
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @model = Model.find(params[:id])
  end

  def new
    @brand = Brand.find(params[:id])
    @model = @brand.models.new
  end

  def update
    @model =Model.find(params[:id])
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to admin_brand_path(id:params[:model][:brand_id]), notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @model = Brand.find(params[:model][:brand_id]).models.new(model_params)
    respond_to do |format|
      if @model.save
        format.html { redirect_to admin_brands_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to admin_brands_path, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:model).permit(:name, :brand_id)
    end

end
