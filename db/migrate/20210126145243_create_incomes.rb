class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.references :category
      t.decimal    :amount,   precision: 8, scale: 2
      t.date       :date
      t.string     :description

      t.timestamps
    end
  end
end
