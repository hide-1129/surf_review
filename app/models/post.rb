class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true
  
  validates :surf_spot, presence: true, length: { maximum: 255 }
  validates :review, presence: true
end
