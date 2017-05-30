class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id

    if @review.save
      redirect_to @product
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:content, :product_id, :user_id)
  end
end
