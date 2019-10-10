class Carriage < ApplicationRecord
  validates :number, presence: true
  validates :train_id, presence: true
  validates :type, inclusion: { in: %w(VipCarriage EconomCarriage CoupeCarriage ExpressCarriage),
    message: "%{value} is not a valid type" }

  belongs_to :train
  before_validation :set_number

  scope :express, -> { where(type: 'ExpressCarriage') }
  scope :econom, -> { where(type: 'EconomCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :vip, -> { where(type: 'VipCarriage') }

  private

  def set_number
    self.number ||=  train.carriages.size + 1
  end
end
