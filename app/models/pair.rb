class Pair < ApplicationRecord
  belongs_to :user
  belongs_to :partner, class_name: 'User'

  validates :user_id, presence: true,uniqueness: true
  validates :partner_id, presence: true,uniqueness: true
end
