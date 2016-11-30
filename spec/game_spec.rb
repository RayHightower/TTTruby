require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
    end

    it "inits the grid with the designation for each cell" do
      sample_grid = @game.get_status
      expect(sample_grid).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "really gets the status, not that made up junk" do
      expect(@game.get_status).to eq false
    end
  end
end
