class User < ApplicationRecord
  attribute :name, :string
  attribute :bio, :text
  attribute :photo, :string
  attribute :posts_count, :integer

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :like, foreign_key: :author_id

  before_validation :set_default_posts_counter
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def set_default_posts_counter
    self.posts_counter ||= 0
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
