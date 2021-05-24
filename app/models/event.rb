class Event < ApplicationRecord
  include Filterable
  belongs_to :user
  has_many :attendees

  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:title].matches("%#{query}%"))
      .or(where(arel_table[:location].matches("%#{query}%")))
  }

  scope :expired, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date >= ?', Date.today) }


end