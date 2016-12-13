require 'grid'

describe Grid do
  context "TTT grid" do

    before do
      @thisgrid = Grid.new
    end

    it "creates the initial TTT grid" do
      sample_grid = Grid.new
      expect(sample_grid.contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "displays the contents of the tic-tac-toe grid" do
      @thisgrid.print_grid
      # What assertion (other than looking at the printout) works here?
    end

    it "prints the grid in color" do
      @thisgrid.add_move("X", 5)
      @thisgrid.add_move("O", 9)
      @thisgrid.print_color_grid
      # What assertion (other than looking at the printout) works here?
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
