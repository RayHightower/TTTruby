require 'grid'

describe Grid do
  context "TTT grid" do

    before do
      @thisgrid = Grid.new
      # $stdout = StringIO.new
    end

    it "creates the initial TTT grid" do
      sample_grid = Grid.new
      expect(sample_grid.contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "can be duplicated with a simple method" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("O", 2)
      grid.add_move("X", 3)
      grid.add_move("O", 4)
      grid.add_move("O", 5)
      grid.add_move("X", 6)
      grid.add_move("X", 7)
      grid.add_move("X", 8)
      grid.add_move("O", 9)

      fake_grid = grid.dupe
      expect(fake_grid.contents).to eq grid.contents
    end

    it "can look at a terminal grid and know that it's terminal" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("O", 2)
      grid.add_move("X", 3)
      grid.add_move("O", 4)
      grid.add_move("O", 5)
      grid.add_move("X", 6)
      grid.add_move("X", 7)
      grid.add_move("X", 8)
      grid.add_move("O", 9)
      expect(grid.terminal?).to eq true
    end

    it "can look at a winning grid and know that it's terminal" do
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("O", 2)
      grid.add_move("O", 3)
      expect(grid.terminal?).to eq true
    end

    it "can look at a non-terminal grid and know that it's non-terminal" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("X", 2)
      grid.add_move("O", 4)
      grid.add_move("O", 9)
      expect(grid.terminal?).to eq false
    end

    it "calculates the number of moves remaining on any given grid" do
      test_grid = Grid.new
      test_grid.add_move("X", 5)
      test_grid.add_move("O", 1)
      test_grid.add_move("X", 8)
      test_grid.add_move("X", 9)
      expect(test_grid.empty_cell_list.count).to eq 5
    end

    it "returns an array containing the designations of empty cells" do
      test_grid = Grid.new
      test_grid.add_move("X", 5)
      test_grid.add_move("O", 1)
      test_grid.add_move("X", 8)
      test_grid.add_move("O", 3)
      expect(test_grid.empty_cell_list).to eq [ 2, 4, 6, 7, 9]
    end

    it "tells us when O wins on the first row" do
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("O", 2)
      grid.add_move("O", 3)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the second row" do
      grid = Grid.new
      grid.add_move("O", 4)
      grid.add_move("O", 5)
      grid.add_move("O", 6)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the third row" do
      grid = Grid.new
      grid.add_move("O", 7)
      grid.add_move("O", 8)
      grid.add_move("O", 9)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the first column" do
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("O", 4)
      grid.add_move("O", 7)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the second column" do
      grid = Grid.new
      grid.add_move("O", 2)
      grid.add_move("O", 5)
      grid.add_move("O", 8)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the third column" do
      grid = Grid.new
      grid.add_move("O", 3)
      grid.add_move("O", 6)
      grid.add_move("O", 9)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the forward-slash diagonal" do
      grid = Grid.new
      grid.add_move("O", 3)
      grid.add_move("O", 5)
      grid.add_move("O", 7)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when O wins on the back-slash diagonal" do
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("O", 5)
      grid.add_move("O", 9)
      expect(grid.who_won).to eq "O"
    end

    it "tells us when X wins on the first row" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("X", 2)
      grid.add_move("X", 3)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the second row" do
      grid = Grid.new
      grid.add_move("X", 4)
      grid.add_move("X", 5)
      grid.add_move("X", 6)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the third row" do
      grid = Grid.new
      grid.add_move("X", 7)
      grid.add_move("X", 8)
      grid.add_move("X", 9)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the first column" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("X", 4)
      grid.add_move("X", 7)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the second column" do
      grid = Grid.new
      grid.add_move("X", 2)
      grid.add_move("X", 5)
      grid.add_move("X", 8)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the third column" do
      grid = Grid.new
      grid.add_move("X", 3)
      grid.add_move("X", 6)
      grid.add_move("X", 9)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the forward-slash diagonal" do
      grid = Grid.new
      grid.add_move("X", 3)
      grid.add_move("X", 5)
      grid.add_move("X", 7)
      expect(grid.who_won).to eq "X"
    end

    it "tells us when X wins on the back-slash diagonal" do
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("X", 5)
      grid.add_move("X", 9)
      expect(grid.who_won).to eq "X"
    end

    it "allows moves between the range of 1 and 9, inclusive" do
      designation = "X"
      location = 4
      returnvalue = @thisgrid.add_move(designation, location)
      expect(returnvalue).to eq true
    end

    it "disallows moves greater than 9" do
      designation = "X"
      location = 10
      returnvalue = @thisgrid.add_move(designation, location)
      expect(returnvalue).to eq false
    end

    it "disallows moves less than 1" do
      designation = "X"
      location = 0
      returnvalue = @thisgrid.add_move(designation, location)
      expect(returnvalue).to eq false
    end

    it "adds a move to a cell" do
      designation = "X"
      location = 4
      @thisgrid.add_move(designation, location)
      expect(@thisgrid.contents[location]).to eq designation
    end

    it "will disallow a move to an occupied cell" do
      location = 5
      original_designation = "X"
      interloper = "O"
      @thisgrid.add_move(original_designation, location)
      @thisgrid.add_move(interloper, location)
      expect(@thisgrid.contents[location]).to eq original_designation
    end

    it "will return false if we try to move into an occupied cell" do
      location = 1
      original_designation = "O"
      interloper = "X"
      @thisgrid.add_move(original_designation, location)
      expect(@thisgrid.add_move(interloper, location)).to eq false
    end

    it "will return true if we move into an empty cell" do
      location = 1
      designation = "O"
      expect(@thisgrid.add_move(designation, location)).to eq true
    end
  end
end
