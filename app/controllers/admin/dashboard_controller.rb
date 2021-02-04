class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: 'jungle', password: 'book'
  
  def show
  @products = Product.all
  @category = Category.all
  @category_length = @category.length
  count = 0
  @products.each do |item|
    count += item.quantity
  end


    @count = count
  end
end
