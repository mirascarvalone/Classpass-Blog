class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, foreign_key: 'author_id'

  def average_rating
    self.posts.average('rating')
  end

  validates :username, uniqueness: true
end
