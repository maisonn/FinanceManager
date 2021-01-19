class Expense < ApplicationRecord
    def change
        create_table :expenses do |t|
          t.string :category
          t.decimal :amount
          t.date :date
          t.timestamps
        end
    end
end
