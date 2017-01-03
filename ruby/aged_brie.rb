class AgedBrie

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    @quality += 1 if @quality < 50
  end

end
