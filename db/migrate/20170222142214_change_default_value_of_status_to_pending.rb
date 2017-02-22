class ChangeDefaultValueOfStatusToPending < ActiveRecord::Migration[5.0]
  def change
    change_column_default :rentals, :status, "pending"
  end
end
