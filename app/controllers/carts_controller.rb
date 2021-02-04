class CartsController < ApplicationController

  def show
    if enhanced_cart.length == 0
      flash[:alert] = 'Please add somethign to your cart first!'
      redirect_to root_path
    end
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    if enhanced_cart.length == 0
      flash[:alert] = 'Your cart is now empty.'
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
