class VipCarriage < Carriage
  validates :place_botton, presence: true

  before_save :nil_place

  private

  def nil_place
    self.place_top = 0
    self.place_top_side = 0
    self.place_botton_side = 0
    self.seat = 0
  end
end
