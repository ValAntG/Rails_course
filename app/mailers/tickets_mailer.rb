class TicketsMailer < ApplicationMailer
  def ticket_buy(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы купили билет')
  end

  def ticket_del(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Билет был возвращен')
  end
end
