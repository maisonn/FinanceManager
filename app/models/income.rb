class Income < ApplicationRecord
  belongs_to :user
  belongs_to :category # belong to one category
end
