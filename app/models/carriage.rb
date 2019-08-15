class Carriage < ApplicationRecord
  validates :number, uniqueness: {scope: :train_id}
  validates :train_id, presence: true
  validates :type, inclusion: { in: %w(VipCarriage EconomCarriage CoupeCarriage ExpressCarriage),
    message: "%{value} is not a valid type" }

  belongs_to :train
  after_create :set_number

  private

  def set_number
    self.number =  train.carriages.size + 1
  end
end
