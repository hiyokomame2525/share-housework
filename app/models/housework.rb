class Housework < ApplicationRecord
  belongs_to :pair

  validates :pair_id,uniqueness:{
                         conditions: -> { where('created_at >= ?', 1.days.ago)},
                         message: '投稿は1日に1回までです'}
end
