class RemoveCategoryFromIncomes < ActiveRecord::Migration[6.1]
  def change
    remove_column :incomes, :category, :string
    add_column :incomes, :category_id, :integer
  end
end
