class Sulfuras

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @quality = @quality if @quality < 50
  end

end