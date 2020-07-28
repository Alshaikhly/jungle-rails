require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before do
      @productAll = Product.new(:name => "table lamp", :price_cents => 1000, :quantity => 4, :category_id => 3)
      @productName = Product.new(:price_cents => 40000, :category_id => 3, :quantity => 100)
      @productQuantity = Product.new(:name => "Hello", :price_cents => 20000, :category_id => 4)
      @productPrice = Product.new(:name => "table lamp", :quantity => 4, :category_id => 3)
      @productCategory = Product.new(:name => "table lamp", :price_cents => 1000, :quantity => 4)

      @productAll.save
      @productName.save
      @productQuantity.save
      @productPrice.save
      @productCategory.save
    end

    describe "product" do
      it "creates a product with all four fields" do
        expect(@productAll.name).to be_present
        expect(@productAll.price_cents).to eql(1000)
        expect(@productAll.quantity).to eql(4)
        expect(@productAll.category_id).to eql(3)
      end
    end

      it "does't have a name" do
        expect(@productName.name).to be_nil
        expect(@productName.category_id).to be_present
        expect(@productName.price_cents).to be_present
        expect(@productName.quantity).to be_present
        expect(@productName.errors.full_messages).to include("Name can't be blank")
      end

      it "does't have a quantity" do
        expect(@productQuantity.name).to be_present
        expect(@productQuantity.category_id).to be_present
        expect(@productQuantity.price_cents).to be_present
        expect(@productQuantity.quantity).to be_nil
        expect(@productQuantity.errors.full_messages).to include("Quantity can't be blank")
      end

      it "does't have a Price" do
        expect(@productPrice.name).to be_present
        expect(@productPrice.category_id).to be_present
        expect(@productPrice.price_cents).to be_nil
        expect(@productPrice.quantity).to be_present
        expect(@productPrice.errors.full_messages).to include("Price can't be blank")
      end

      it "does't have a category" do
        expect(@productCategory.name).to be_present
        expect(@productCategory.category_id).to be_nil
        expect(@productCategory.price_cents).to be_present
        expect(@productCategory.quantity).to be_present
        expect(@productCategory.errors.full_messages).to include("Category can't be blank")
      end
      
  end
end
