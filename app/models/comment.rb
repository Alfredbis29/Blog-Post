class Comment < ApplicationRecord
  belongs_to :post

  validates :author_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :body, presence: true, length: { minimum: 2 }

  # Safe likes accessor
  def likes
    likes_count || 0
  end
end


