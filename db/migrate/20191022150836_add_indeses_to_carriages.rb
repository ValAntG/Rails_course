class AddIndesesToCarriages < ActiveRecord::Migration[5.2]
  def change
    add_index :carriages, [:id, :type]
    add_index :carriages, :train_id
  end
end
