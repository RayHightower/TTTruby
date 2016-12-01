require 'grid'

describe Grid do
  context "what the grid should look like" do

    it "creates the initial TTT grid" do
      sample_grid = Grid.new
      expect(sample_grid.contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "prints a horizontal line for the grid" do
    end

    it "displays the contents of the tic-tac-toe grid" do
    end
  end
end
