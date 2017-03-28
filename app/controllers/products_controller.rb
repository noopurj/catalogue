class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # initialize empty arrays
    a = []
    b = []
    c = []

    # get products of different categories, sub categories and subsub categories
    a = category_ids(params[:category_ids]) if params[:category_ids].present?
    b = subcategory_ids(params[:subcategory_ids]) if params[:subcategory_ids].present?
    c = subsubcategory_ids(params[:subsubcategory_ids]) if params[:subsubcategory_ids].present?

    # find intersection of the three arrays ignoring the nil arrays
    @products = [ a, b, c ].tap{ |a| a.delete( [] ) }.reduce( :& ) || []
  end

  def category_ids(id)
    Category.where(id: id).all.map {|cat| cat.products}.flatten
  end

  def subcategory_ids(id)
    Subcategory.where(id: id).all.map {|cat| cat.products}.flatten
  end

  def subsubcategory_ids(id)
    Subsubcategory.where(id: id).all.map {|cat| cat.products}.flatten
  end

  def filtering_params(params)
    params.slice(:subcategory_ids, :category_ids, :subsubcategory_ids)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_ids => [], :subcategory_ids => [], :subsubcategory_ids => [])
    end
end
