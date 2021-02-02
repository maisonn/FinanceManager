class Category < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :delete # can have many expenses
    has_many :incomes, dependent: :delete  # can have many incomes
    def to_s
        name
    end
end
