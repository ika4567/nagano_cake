class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @user = Customer.find(params[:id])
  end

  def update
  end

  def cancel
  end

  def withdraw
  end
end
