class EconomCarriage < Carriage
  validates :place_top, :place_botton, :place_top_side, :place_botton_side, presence: true
end
