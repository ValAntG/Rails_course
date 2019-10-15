class Admin::TicketsController < TicketsController
  include CheckAdmin

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to [:admin, @ticket], notice: 'ticket was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
