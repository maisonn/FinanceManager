class Expense < ApplicationRecord
    def index
        @expenses = Expense.all.order(date: :desc)
    end
end
