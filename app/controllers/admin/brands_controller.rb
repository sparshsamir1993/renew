class Admin::BrandsController < ApplicationController
    def index
        @brands = Brand.all
    end

    def show
      @brand = Brand.find(params[:id])
      @models = Brand.find(params[:id]).models.all

    end

    def new
        @brand = Brand.new
    end

    def edit
      @brand = Brand.find(params[:id])
    end

    def create
      @brand = Brand.new(brand_params)

      respond_to do |format|
        if @brand.save
          format.html { redirect_to admin_brands_path, notice: 'Brand was successfully created.' }
          format.json { render :show, status: :created, location: @brand }
        else
          format.html { render :new }
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /brands/1
    # PATCH/PUT /brands/1.json
    def update
      @brand = Brand.find(params[:id])
      respond_to do |format|
        if @brand.update(brand_params)
          format.html { redirect_to admin_brand_path(@brand), notice: 'Brand was successfully updated.' }
          format.json { render :show, status: :ok, location: @brand }
        else
          format.html { render :edit }
          format.json { render json: @brand.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /brands/1
    # DELETE /brands/1.json
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
      def set_brand
        @brand = Brand.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def brand_params
        params.require(:brand).permit(:name)
      end
end