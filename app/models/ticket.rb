class Ticket < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :passport_series, presence: true
  validates :passport_numbers, presence: true
  validates_with TicketByTrainValidator

  belongs_to :user
  belongs_to :rsr_first, class_name: 'RailwayStationsRoute', foreign_key: :rsr_first_id, inverse_of: :tickets
  belongs_to :rsr_last, class_name: 'RailwayStationsRoute', foreign_key: :rsr_last_id, inverse_of: :tickets

  after_create :send_notification
  after_destroy :send_destroy_ticket

  def route_name
    "#{rsr_first.railway_station.title} - #{rsr_last.railway_station.title} "
  end

  private

  def send_notification
    TicketsMailer.ticket_buy(self.user, self).deliver_now
  end

  def send_destroy_ticket
    TicketsMailer.ticket_del(self.user, self).deliver_now
  end
end
