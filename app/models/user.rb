class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :categories, dependent: :delete
  has_many :expenses, dependent: :delete
  has_many :incomes, dependent: :delete
end
