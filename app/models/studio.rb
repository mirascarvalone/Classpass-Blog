class Studio < ActiveRecord::Base

  has_many :posts

  geocoded_by :address
  after_validation :geocode

  def average_rating
    posts.average('rating')
  end
end
