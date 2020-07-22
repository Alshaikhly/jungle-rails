class Admin::DashboardController < ApplicationController
  
  def show
    @productCount = Product.count("id")
    @catCount = Category.count("id")
  end
end
