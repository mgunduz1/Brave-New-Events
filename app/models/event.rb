class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees

  scope :expired, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date >= ?', Date.today) }
end