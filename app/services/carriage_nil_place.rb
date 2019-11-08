module CarriageNilPlace
  PLACE = {ExpressCarriage: ['place_top', 'place_botton', 'place_top_side', 'place_botton_side'],
            EconomCarriage: ['seat'],
             CoupeCarriage: ['place_top_side', 'place_botton_side', 'seat'],
               VipCarriage: ['place_top', 'place_top_side', 'place_botton_side', 'seat'] }

  def self.nil_place(params)
    place_nil = PLACE[:"#{params[:type]}"]
    params.each do |key, val|
      params[key] = 0 if place_nil.include?(key)
    end
  end
end
