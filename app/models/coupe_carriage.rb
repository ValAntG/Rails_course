class CoupeCarriage < Carriage
  validates :place_top, :place_botton, presence: true
end
