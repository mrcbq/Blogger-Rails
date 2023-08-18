class Like < ApplicationRecord
  attribute :author_id, :integer
  attribute :post_id, :integer

  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User'

  def update_post_likes_count
    post.update(likes_count: post.likes.count)
  end
end
