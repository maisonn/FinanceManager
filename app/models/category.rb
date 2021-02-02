class Category < ApplicationRecord
    belongs_to :user
    has_many :expenses, dependent: :delete_all # can have many expenses
    has_many :incomes, dependent: :delete_all  # can have many incomes
    def to_s
        name
    end
end
