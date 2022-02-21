class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  def sum_of_price
    (tax_price * amount).round(0)
  end
  
  def postage
    800
  end
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
