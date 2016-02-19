require 'csv'

class ProductsController < ApplicationController
  def index
    @products = fetch_products

    if params[:search_text].present?
      @products = @products.select{|product| product.item.downcase.include? params[:search_text].downcase}
    end

  end

  def view
    @product = fetch_products.find{|product| product.pid == params[:pid].to_i }
    if @product.nil?
      render text: "Product not found.", status: 404
    end

    @products_location = products_by_location(@product.location, @product.category)
    if @products_location.nil?
      @output_msg = "No other similar products found at this location."
    else
      @output_msg = "Other #{@product.category} products at this location: #{@products_location.join(", ")}"
    end
  end

  def location
    @products = fetch_products.select{|product| product.location == params[:location]}
    if @products.nil?
      render text: "Product not found.", status: 404
    end
    render :index
  end

  def category
    @products = fetch_products.select{|product| product.category == params[:category]}
    if @products.nil?
      render text: "Product not found.", status: 404
    end
    render :index

  end

  def fetch_products
    products = []
    CSV.foreach("mf_inventory.csv", headers: true) do |row|
      product_hash = row.to_hash

      if product_hash["quantity"].to_i > 0
        product = Product.new
        product.pid = product_hash["pid"].to_i
        product.item = product_hash["item"]
        product.description = product_hash["description"]
        product.price = product_hash["price"]
        product.condition = product_hash["condition"]
        product.dimension_w = product_hash["dimension_w"]
        product.dimension_l = product_hash["dimension_l"]
        product.dimension_h = product_hash["dimension_h"]
        product.img_file = product_hash["img_file"]
        product.quantity = product_hash["quantity"]
        product.category = product_hash["category"]

        products << product
      end
    end
    # get unique products only
    products = products.uniq {|product| product.pid}
    # sort products
    products = products.sort {|x, y| x.category <=> y.category}
  end

  def products_by_category (input_category)
    fetch_products.select{|product| product.category.include?(input_category)}
  end

  def products_by_location (input_location, input_category)
    fetch_products
      .select{|product| product.location.include?(input_location)}
      .select{|product| product.category.include?(input_category)}
      .map {|product| product.item}
  end

end
