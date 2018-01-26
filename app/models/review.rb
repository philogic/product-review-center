class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  validates :comment, length: { minimum: 10 }
  validates :rating, inclusion: { in: (1..5).to_a }

  after_save :broadcast_save

  def broadcast_save
    ActionCable.server.broadcast 'notifications', status: 'created',
                                 id: id, product: self.product.name,
                                 review_author: self.customer.username,
                                 rating: rating

  end
end
