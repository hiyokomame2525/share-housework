class Pair < ApplicationRecord
  belongs_to :user
  belongs_to :partner, class_name: 'User'
  has_many :houseworks

  validates :user_id, presence: true,uniqueness: { message: "User has already been taken" } 
  validates :partner_id, presence: true,uniqueness: {message: "Partner has already been taken" } 
end
