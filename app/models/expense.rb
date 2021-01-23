class Expense < ApplicationRecord
    def change
        create_table :expenses do |t|
          t.string :category
          t.decimal :amount
          t.date :date
          t.string :description
          t.timestamps
        end
    end
    has_many :reports
end
