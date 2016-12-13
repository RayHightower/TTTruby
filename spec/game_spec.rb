require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
      @player = []
      @player[0] = Player.new("X")
      @player[1] = Player.new("O")
    end

    it "inits the game" do
      sample_grid_contents = @game.get_status
      expect(sample_grid_contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "inits the first player with the correct designation" do
      @player[0].designation = "X"
      expect(@player[0].designation).to eq "X"
    end

    it "inits the second player with the correct designation" do
      @player[1].designation = "O"
      expect(@player[1].designation).to eq "O"
    end

    it "prints the current state of the grid" do
      @game.print_grid
    end

    it "adds a move to the grid" do
      move = 5
      mover = @player[0]
      @game.add_move(mover, move)
      expect(@game.get_status).to eq [ 0, 1, 2, 3, 4, "X", 6, 7, 8, 9 ]
    end

    it "checks for a winnner" do
      @game.check_winner
    end
  end
end
