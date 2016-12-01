require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
      @player = []
      @player[0] = Player.new
      @player[1] = Player.new
    end

    it "inits the game" do
      sample_grid_contents = @game.get_status
      expect(sample_grid_contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "inits the players" do

    end

    it "prints the current state of the grid" do
      @game.print_grid
    end

  end
end
