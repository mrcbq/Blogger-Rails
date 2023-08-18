class Post < ApplicationRecord
  attribute :author_id, :integer
  attribute :title, :string
  attribute :text, :text
  attribute :comments_count, :integer
  attribute :likes_count, :integer

  belongs_to :author, class_name: 'User', counter_cache: true
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  after_create :update_author_posts_count
  after_destroy :update_author_posts_count

  def update_author_posts_count
    author.update(posts_count: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
