class AddSortcarToTrain < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :sortcar, :boolean, default: true
  end
end
