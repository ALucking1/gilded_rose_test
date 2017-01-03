class BackstagePasses

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    if @quality < 50
      if @sell_in.between?(6, 10)
        @quality += 2
      elsif @sell_in.between?(1, 5)
        @quality += 3
      else @sell_in = 0
        @quality = 0
      end
    end
  end

end
