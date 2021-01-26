class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.string :category
      t.decimal :amount
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
