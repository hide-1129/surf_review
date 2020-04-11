class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    #validates :surfing_history, presence: true, length: { maximum: 10 }
    #validates :self_introduction, presence: true
    
    has_secure_password
    
    has_many :posts
    
    has_many :favorites
    has_many :fav_posts, dependent: :destroy, through: :favorites, source: :post
    
    def favorite(other_post)
      unless self == other_post
        self.favorites.find_or_create_by(post_id: other_post.id)
      end
    end
    
    def unfavorite(other_post)
      favorite = self.favorites.find_by(post_id: other_post.id)
      favorite.destroy if favorite
    end
    
    def fav_posts?(other_post)
      self.fav_posts.include?(other_post)
    end
end
