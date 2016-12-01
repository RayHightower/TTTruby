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
  end
end
