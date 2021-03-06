class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  def get_image(width,height)
    unless self.item.image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    self.item.image.variant(resize_to_limit: [width, height]).processed
  end

  # 小計
  def sum_of_price
    item.with_tax_price * amount
  end

end
