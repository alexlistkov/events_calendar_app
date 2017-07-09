class Event < ApplicationRecord
  belongs_to :user
  default_scope -> { order(date: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :date, presence: true
end
