class AddIsAnnualToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :is_annual, :boolean
  end
end
