class Issue < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  validates :comment, length: { minimum: 20 }
  validates :status, inclusion: { in: %w(reported investigated fixing fixed),
                                  message: '%{value} is not a valid status name' }
  validates :severity, inclusion: { in: %w(cosmetic minor major critical),
                                    message: '%{value} is not a valid severity level' }
end
