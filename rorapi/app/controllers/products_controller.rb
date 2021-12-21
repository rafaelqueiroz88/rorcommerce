class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all.map do |product| {
      id: product.encrypt_id,
      name: product.name, 
      value: product.value,
      tags: product.tags
    } 
    end

    render json: { products: @products }
  end
  
  # GET /products/1
  def show
    # product = {
    #   id: @product.encrypt_id,
    #   name: @product.name, 
    #   value: @product.value,
    #   tags: @product.tags
    # } 
    
    # render json: { product: product }
    
    # render json: ProductBlueprint.render(@product, view: :extended), status: 200
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

 # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(Encryptor.decrypt(params[:id].to_s))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :value, :tags)
    end
end
