class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attribute :name, :string
  attribute :bio, :text
  attribute :photo, :string
  attribute :posts_count, :integer

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :like, foreign_key: :author_id

  before_create :set_default_photo
  before_validation :set_default_posts_count
  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def set_default_posts_count
    self.posts_count ||= 0
  end

  def set_default_photo
    self.photo ||= "https://randomuser.me/api/portraits/men/#{rand(1..100)}.jpg"
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
