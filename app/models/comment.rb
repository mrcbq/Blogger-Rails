class Comment < ApplicationRecord
  attribute :author_id, :integer
  attribute :post_id, :integer
  attribute :text, :text

  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User'

  def update_post_comments_count
    post.update(comments_count: post.comments.count)
  end
end
