class Carriage < ApplicationRecord
  validates :train_id, presence: true
  validates :type_car, inclusion: { in: %w(econom coupe),  message: "%{value} is not a valid type" }

  belongs_to :train
end
