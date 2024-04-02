class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :pair, dependent: :destroy
  has_one :partner, through: :pair, source: :partner
  has_one :reverse_pair, class_name: "Pair", foreign_key: "partner_id", dependent: :destroy
  has_one :buddy, through: :reverse_pair, source: :user

  has_many :houseworks

         validates :nickname, presence: true
         validates :birthday, presence: true
end
