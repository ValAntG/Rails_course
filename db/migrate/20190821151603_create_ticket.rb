class CreateTicket < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :last_name
      t.string :first_name
      t.string :father_name
      t.string :passport_series
      t.integer :passport_numbers
      t.integer :rsr_first_id
      t.integer :rsr_last_id
      t.integer :user_id

      t.timestamps
    end
  end
end
