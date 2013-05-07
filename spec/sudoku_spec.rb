require './lib/sudoku'

# 003 020 600
# 900 305 001
# 001 806 400
# 
# 008 102 900
# 700 000 008
# 006 708 200
# 
# 002 609 500
# 800 203 009
# 005 010 300

describe Sudoku do 

  let(:game) { Sudoku.new '003020600900305001001806400008102900700000008006708200002609500800203009005010300' }
  context '.new' do
    it 'accepts a new grid as a single string of numbers' do
      game
    end

    it 'has 9 rows' do
      game.rows.count.should eq 9
    end

    it 'has 9 columns' do
      game.columns.count.should eq 9
    end

    it 'has 9 boxes' do
      game.boxes.count.should eq 9
    end

    it 'has value correct values in coulmns' do
      game.columns[2][0].should eq '3'
      game.columns[4][0].should eq '2'
      game.columns[6][0].should eq '6'
      
      game.columns[0][1].should eq '9'
      game.columns[3][1].should eq '3'
      game.columns[5][1].should eq '5'
      game.columns[8][1].should eq '1'
      
      game.columns[2][2].should eq '1'
      game.columns[3][2].should eq '8'
      game.columns[5][2].should eq '6'
      game.columns[6][2].should eq '4'
    end

    it 'has value correct values in rows' do
      game.rows[3][2].should eq '8'
      game.rows[3][3].should eq '1'
      game.rows[3][5].should eq '2'
      game.rows[3][6].should eq '9'

      game.rows[4][0].should eq '7'
      game.rows[4][8].should eq '8'

      game.rows[5][2].should eq '6'
      game.rows[5][3].should eq '7'
      game.rows[5][5].should eq '8'
      game.rows[5][6].should eq '2'
    end

    it 'has value correct values in boxes' do
      # game.rows[3][2].should eq '8'
      # game.rows[3][3].should eq '1'
      # game.rows[3][5].should eq '2'
      # game.rows[3][6].should eq '9'

      # game.rows[4][0].should eq '7'
      # game.rows[4][8].should eq '8'

      # game.rows[5][2].should eq '6'
      # game.rows[5][3].should eq '7'
      # game.rows[5][5].should eq '8'
      # game.rows[5][6].should eq '2'
    end
  end
end