module CarriageNilPlace
  def self.nil_place(params)
    nil_place_ExpressCarriage(params) if params[:type] == "ExpressCarriage"
    nil_place_EconomCarriage(params) if params[:type] == "EconomCarriage"
    nil_place_CoupeCarriage(params) if params[:type] == "CoupeCarriage"
    nil_place_VipCarriage(params) if params[:type] == "VipCarriage"
    params
  end

  def self.nil_place_ExpressCarriage(params)
    params[:place_top] = 0
    params[:place_botton] = 0
    params[:place_top_side] = 0
    params[:place_botton_side] = 0
  end

  def self.nil_place_EconomCarriage(params)
    params[:seat] = 0
  end

  def self.nil_place_CoupeCarriage(params)
    params[:place_top_side] = 0
    params[:place_botton_side] = 0
    params[:seat] = 0
  end

  def self.nil_place_VipCarriage(params)
    params[:place_top] = 0
    params[:place_top_side] = 0
    params[:place_botton_side] = 0
    params[:seat] = 0
  end
end
