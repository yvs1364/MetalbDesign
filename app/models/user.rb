class User < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
