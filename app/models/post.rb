class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author, presence: true, length: { minimum: 2, maximum: 100 }

  # Returns a safe views count (defaults to 0)
  def views
    self.views_count || 0
  end
end


