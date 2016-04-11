class ChangeSupplyDateDueFromStringToDate < ActiveRecord::Migration
  def change
    change_column :supplies, :date_due, :date
  end
end
