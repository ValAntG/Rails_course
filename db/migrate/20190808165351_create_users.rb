class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :surname, null: false
      t.string :workgroup

      t.timestamps
    end
  end
end
