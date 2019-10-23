class AddIndesesToTickets < ActiveRecord::Migration[5.2]
  def change
    add_index :tickets, :rsr_first_id
    add_index :tickets, :rsr_last_id
  end
end
