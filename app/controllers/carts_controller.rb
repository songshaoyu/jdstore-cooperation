class CartsController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user!



  # 清空購物車
  def clear
    current_cart.clear!
    flash[:warning] = t('message-clear-cart-success')
    redirect_to carts_path
  end

  # 下訂
  def checkout
    @order = Order.new
  end

end
