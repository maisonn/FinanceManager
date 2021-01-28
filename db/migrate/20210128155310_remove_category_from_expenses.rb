class RemoveCategoryFromExpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :category, :string
    add_column :expenses, :category_id, :integer
  end
end
