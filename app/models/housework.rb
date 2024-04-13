class Housework < ApplicationRecord
  belongs_to :pair

  validates :pair_id,uniqueness:{
                         conditions: -> { where('created_at >= ?', 1.days.ago)},
                         message: '投稿は1日に1回までです'}

  from  = 1.week.ago.beginning_of_day
  to    = Time.current.end_of_day
  week_counts ={
    laundry_buddy: Housework.where("created_at >= ? AND laundry = ?", from..to, true).count,
    laundry_partner: Housework.where("created_at >= ? AND laundry = ?", from..to, false).count,
    dishes_buddy: Housework.where("created_at >= ? AND dishes = ?", from..to, true).count,
    dishes_partner: Housework.where("created_at >= ? AND dishes = ?", from..to, false).count,
    cooking_buddy: Housework.where("created_at >= ? AND cooking = ?", from..to, true).count,
    cooking_partner: Housework.where("created_at >= ? AND cooking = ?", from..to, false).count,
    clean_room_buddy: Housework.where("created_at >= ? AND clean_room = ?",  from..to, true).count,
    clean_room_partner: Housework.where("created_at >= ? AND clean_room = ?", from..to, false).count,
    bathroom_buddy: Housework.where("created_at >= ? AND bathroom = ?",  from..to, true).count,
    bathroom_partner: Housework.where("created_at >= ? AND bathroom = ?", from..to, false).count,
    trash_buddy: Housework.where("created_at >= ? AND trash = ?", from..to, true).count,
    trash_partner: Housework.where("created_at >= ? AND trash = ?", from..to, false).count,
    toilet_buddy: Housework.where("created_at >= ? AND toilet = ?", from..to, true).count,
    toilet_partner: Housework.where("created_at >= ? AND toilet = ?", from..to, false).count
  }

end