class Expense < ApplicationRecord
  belongs_to :category # belong to one category
end