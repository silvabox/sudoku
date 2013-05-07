class Sudoku
  def initialize(grid_def)
    build_grid grid_def
  end

  def rows
    return @rows
  end

  def columns
    return @columns
  end

  def boxes
    return Array.new(9)
  end

  private 
  def build_grid(grid_def)
    numbers = grid_def.chars.to_a
    @rows = []
    @columns = []

    (0..8).each do |row|
      (0..8).each do |column|
        @rows[row] ||= []
        @rows[row][column] = numbers[(row * 9) + column]

        @columns[column] ||= []
        @columns[column][row] = numbers[(row * 9) + column]
      end
    end
    # puts @rows.inspect
    # puts @columns.inspect
  end
end