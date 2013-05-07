class Cell
  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end
end