class User < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end

# Pour limité le nombre d'utilisateur
# before_create :check_moderator_limit
#   private
#   devise  :database_authenticatable,
#           :trackable,
#           :validatable,
#           :timeoutable,
#           :registerable

#   def check_moderator_limit
#     if User.count > 3
#       return false
#     end
#     true
#   end
