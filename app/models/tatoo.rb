class Tatoo < ApplicationRecord
  default_scope { order('sequence ASC') }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  def price
    [999, 1420, 1945, 3000, 5900][id%5]
  end
end
