class Review < ApplicationRecord
  belongs_to :item
  validates :title, presence: true
  validates :content, length: { minimum: 20 }
  validates :name, presence: true
end
