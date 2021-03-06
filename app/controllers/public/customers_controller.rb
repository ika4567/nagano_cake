class Public::CustomersController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :edit, :update, :cancel, :withdraw]

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to my_page_path
  end

  def cancel
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: true)
    # セッション情報のリセット。これが無いとログインしたままになる。
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
