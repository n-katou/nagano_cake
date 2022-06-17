class AddIsActiveToCustomers < ActiveRecord::Migration[6.1]
  def up
    change_column :customers, :is_active, :boolean, default: true, null: false
  end

  def down
    change_column :customers, :is_active, :boolean
  end
end
