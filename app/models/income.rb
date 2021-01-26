class Income < ApplicationRecord
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
