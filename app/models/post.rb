class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  belongs_to :studio

  def author_username
    author.username
  end

  def studio_name
    studio.name
  end

  validates :content, presence: true
  validates :title, presence: true
  validates :studio, presence: true

end
