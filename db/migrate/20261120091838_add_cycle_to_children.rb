class AddCycleToChildren < ActiveRecord::Migration[8.1]
  def change
    add_column :children, :cycle, :string
  end
end
