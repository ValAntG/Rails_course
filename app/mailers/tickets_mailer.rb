class TicketsMailer < ApplicationMailer
  def ticket_buy(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end
end
