class User < ApplicationRecord
  attribute :name, :string
  attribute :bio, :text
  attribute :photo, :string
  attribute :posts_count, :integer

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :like, foreign_key: :author_id

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
