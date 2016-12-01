require 'grid'

describe Grid do
  context "what the grid should look like" do

    before do
      @thisgrid = Grid.new

    end

    it "creates the initial TTT grid" do
      sample_grid = Grid.new
      expect(sample_grid.contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "displays the contents of the tic-tac-toe grid" do
      @thisgrid.print_grid
    end

    it "adds a move to a cell" do
      designation = "X"
      location = 4
      @thisgrid.add_move(designation, location)
      expect(@thisgrid.contents[location]).to eq designation
    end

    it "determines whether or not a cell is occupied" do

    end
  end
end
