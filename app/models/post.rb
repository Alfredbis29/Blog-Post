class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :author, presence: true, length: { minimum: 2, maximum: 100 }
end

