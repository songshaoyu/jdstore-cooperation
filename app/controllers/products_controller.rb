class ProductsController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user! , only: [:join, :quit]


  def index
    if params[:category].present?
     @category_id = Category.find_by(name: params[:category]).id
     @products = Product.where(:category_id => @category_id).order("created_at DESC")
   else
      @products = case params[:order]
      when 'by_product_price'
        Product.all.order("price DESC")
      when 'by_product_quantity'
        Product.all.order('quantity DESC')
      else
        Product.all.recent
    end
   end
  end

  def show
    @product = Product.find(params[:id])
    @reviews =  @product.reviews.order("created_at DESC")
    @review = Review.new
    @photos = @product.photos.all
  end



  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
    else
      flash[:warning] = "不能重复加入商品"
    end
     redirect_to :back
   end


  def search
     if @query_string.present?
       @products = search_params
     end
   end
  #  收藏
  def join
   @product = Product.find(params[:id])

    if !current_user.is_member_of?(@product)
      current_user.join!(@product)
      flash[:notice] = "收藏成功！"
    else
      flash[:warning] = "你已经收藏了！"
    end

    redirect_to product_path(@product)
  end

  def quit
    @product = Product.find(params[:id])

    if current_user.is_member_of?(@product)
      current_user.quit!(@product)
      flash[:alert] = "取消收藏！"
    else
      flash[:warning] = "你没有收藏，怎么取消 XD"
    end

    redirect_to product_path(@product)
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  private

  def search_params
   Product.ransack({:title_or_description_cont => @query_string}).result(distinct: true)
  end
end
