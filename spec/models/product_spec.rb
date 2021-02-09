require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should have a name' do
      @category = Category.create({ name: 'name' })
      @product = Product.new({ name: 'name', price_cents: 100, quantity: 10, category: @category })
      expect(@product.name).to be_present
    end
    it 'should have price' do 
      @category = Category.create({ name: 'name' })
      @product = Product.new({ name: 'name', price_cents: 100, quantity: 10, category: @category })
      expect(@product.price_cents).to be_present
    end 
    it 'should have quantity' do
      @category = Category.create({ name: 'name' })
      @product = Product.new({ name: 'name', price_cents: 100, quantity: 10, category: @category })
      expect(@product.quantity).to be_present
    end
    it 'should have a category' do
      @category = Category.create({ name: 'name' })
      @product = Product.new({ name: 'name', price_cents: 100, quantity: 10, category: @category })
      expect(@product.category).to be_present
    end
    it 'product should not be valid without product information' do
      @product = Product.new({})
      expect(@product).to_not be_valid
    end
  end
end
