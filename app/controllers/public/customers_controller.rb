class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @user = Customer.find(current_customer)
  end

  def update
  end

  def cancel
  end

  def withdraw
  end
end
