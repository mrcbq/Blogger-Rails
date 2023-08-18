class Like < ApplicationRecord
  attribute :author_id, :integer
  attribute :post_id, :integer

  belongs_to :post, counter_cache: true
  belongs_to :author, class_name: 'User'

  def 
end
