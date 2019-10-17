class Ticket < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :passport_series, presence: true
  validates :passport_numbers, presence: true
  validates_with TicketByTrainValidator

  belongs_to :user
  belongs_to :rsr_first, class_name: 'RailwayStationsRoute', foreign_key: :rsr_first_id
  belongs_to :rsr_last, class_name: 'RailwayStationsRoute', foreign_key: :rsr_last_id
end
