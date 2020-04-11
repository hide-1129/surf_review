class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture, optional: true
  
  validates :surf_spot, presence: true, length: { maximum: 255 }
  validates :review, presence: true
  
  has_many :favorites
  has_many :users, through: :favorites
end
