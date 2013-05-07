require 'sudoku'
require 'cell'

module Sudoku
  class Puzzle
    def initialize(grid_def)
      @rows, @columns, @boxes, @cells = [], [], []

      build_grid grid_def
    end

    # create a constant to represent allowed values, to enable set manipulation
    ALLOWED_VALUES = ['1', '2', '3', '4', '5', '6', '7', '8', '9'].freeze

    def rows
      @rows
    end

    def columns
      @columns
    end

    def boxes
      @boxes
    end

    def valid?
      0.upto(8) { |row| return false if row_values(row).uniq! }
      0.upto(8) { |col| return false if column_values(col).uniq! }
      0.upto(8) { |box| return false if box_values(box).uniq! }
      true
    end

    def each_unknown
      @cells.each_with_index do |cell, i|
        next unless cell.value == '0'
        
        row = Sudoku.row_index(i)
        column = Sudoku.column_index(i)
        box = Sudoku.box_index(row, column)

        yield row, column, box
      end
    end

    def possible_values_for(row, column, box)
      ALLOWED_VALUES - (row_values(row) + column_values(column) + box_values(box))
    end

    def dup
      copy = super # Make a shallow copy by calling Object.dup
      # Make a new copy of the internal data
      @cells = @cells.dup
      @rows = @rows.dup
      @columns = @columns.dup
      @boxes = @boxes.dup
      
      copy # Return the copied object
    end

    def to_s
      str = "-----------------\n"
      @cells.each_with_index do |cell, i|
        str += cell.value
        str += ' | ' if i % 3 == 2
        str += "\n" if i % 9 == 8
        str += "-----------------\n" if i % 27 == 26
      end
      str
    end

    private

    def row_values(row)
      @rows[row].reject { |cell| cell.value == '0' }.map { |cell| cell.value }
    end

    def column_values(column)
      @columns[column].reject { |cell| cell.value == '0' }.map { |cell| cell.value }

    end

    def box_values(box)
      @boxes[box].reject { |cell| cell.value == '0' }.map { |cell| cell.value }
    end

    def build_grid(grid_def)
      numbers = grid_def.chars.to_a

      @cells = []
      numbers.each_with_index do |number, i|
        cell = Cell.new(number)

        row = Sudoku.row_index(i)
        column = Sudoku.column_index(i)


        @cells[i] = cell
        create_row_entry row, column, cell
        create_column_entry row, column, cell
        create_box_entry row, column, cell
      end
    end

    def create_row_entry(row, column, cell)
        @rows[row] ||= []
        @rows[row][column] = cell
    end

    def create_column_entry(row, column, cell)
        @columns[column] ||= []
        @columns[column][row] = cell
    end

    def create_box_entry(row, column, cell)
        box = Sudoku.box_index(row, column)
        box_cell = Sudoku.box_cell_index(row, column)

        @boxes[box] ||= []
        @boxes[box][box_cell] = cell
    end
  end
end