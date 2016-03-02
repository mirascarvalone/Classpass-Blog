class User < ActiveRecord::Base
  has_secure_password

  has_many :posts, foreign_key: 'author_id'

  validates :username, uniqueness: true
end
