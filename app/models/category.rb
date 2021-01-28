class Category < ApplicationRecord
    has_many :expenses # can have many expenses
    has_many :incomes  # can have many incomes
    def to_s
        name
    end
end
