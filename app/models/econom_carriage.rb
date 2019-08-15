class EconomCarriage < Carriage
  validates :place_top, :place_botton, :place_top_side, :place_botton_side, presence: true

  before_save :nil_place

  private

  def nil_place
    self.seat = 0
  end
end
