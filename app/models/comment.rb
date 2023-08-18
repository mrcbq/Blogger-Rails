class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comments_count
    post.update(comments_count: post.comments.count)
  end
end
