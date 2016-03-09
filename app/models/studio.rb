class Studio < ActiveRecord::Base

  has_many :posts

  geocoded_by :address
  after_validation :geocode

  def average_rating
    if posts.average('rating')
      posts.average('rating').round(2)
    end
  end

end
