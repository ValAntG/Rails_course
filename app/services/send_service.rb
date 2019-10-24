module SendService
  def self.send_notification(user, ticket)
    TicketsMailer.ticket_buy(user, ticket).deliver_now
  end

  def self.send_destroy_ticket(user, ticket)
    TicketsMailer.ticket_del(user, ticket).deliver_now
  end
end
