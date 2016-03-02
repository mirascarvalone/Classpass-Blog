class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def author_username
    author.username
  end
end
