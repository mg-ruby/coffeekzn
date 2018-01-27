class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :update, :destroy]
  rescue_from Mongoid::Errors::DocumentNotFound, with: :not_found
  # GET /shops
  def index
    @shops = Shop.all

    render json: @shops
  end

  # GET /shops/1
  def show
    render json: @shop
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      render json: @shop, status: :created, location: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shops/1
  def update
    if @shop.update(shop_params)
      render json: @shop
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shops/1
  def destroy
    @shop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_params
      params.require(:shop).permit(:title, :description, :address, :preview_image)
    end

    def not_found
      respond_with '{"error": "not_found"}', status: :not_found
    end
end
