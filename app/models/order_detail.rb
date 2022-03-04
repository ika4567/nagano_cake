class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  # 小計
  def sum_of_price
    item.with_tax_price * amount
  end

end
