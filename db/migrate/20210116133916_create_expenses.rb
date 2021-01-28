class CreateExpense < ActiveRecord::Migration[6.1]
  def change
    create_table :expense do |t|
      t.references :category
      t.decimal    :amount,   precision: 8, scale: 2
      t.date       :date
      t.string     :description
      # OR same result
      t.bigint     :category_id
    end
  end
end
