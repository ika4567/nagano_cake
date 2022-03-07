class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  # 送料
  def postage
    800
  end

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

  enum payment: { credit_card: 0, transfer: 1 }
  
end
