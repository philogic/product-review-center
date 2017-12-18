class Product < ApplicationRecord
  has_many :reviews
  has_many :issues
  has_many :reviewing_customers, through: :reviews, source: :customer
  has_many :complaining_customers, through: :issues, source: :customer

  validates :name, length: { minimum: 3 }
  validates :code, length: { is: 4 }
  validates :category, inclusion: { in: %w(board strategy arcade rpg shooter),
                                    message: '%{value} is not a valid category' }
end
