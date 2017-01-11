require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
      @player = [Player.new("X"), Player.new("O")]
      @fake_console = StringIO.new
      $stdout = @fake_console
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

    it "adds a move to the grid" do
      move = 5
      mover = @player[0]
      @game.add_move(mover, move)
      expect(@game.get_status).to eq [ 0, 1, 2, 3, 4, "X", 6, 7, 8, 9 ]
    end

    it "will not allow a move to an occupied cell" do
      move = 5
      mover = @player[0]
      @game.add_move(mover, move)
      mover = @player[1]
      @game.add_move(mover, move)
      expect(@game.get_status).to eq [ 0, 1, 2, 3, 4, "X", 6, 7, 8, 9 ]
    end

    it "will yell loudly when a player tries to make an illegal move" do
      move = 5
      mover = @player[0]
      @game.add_move(mover, move)
      mover = @player[1]
      reaction = @game.add_move(mover, move)
      expect(reaction).to eq false
    end

    it "checks for a 1st row horizontal winnner" do
      @game.add_move(@player[1], 1)
      @game.add_move(@player[1], 2)
      @game.add_move(@player[1], 3)
      expect(@game.check_winner).to eq true
    end

    it "checks for a 2nd row horizontal winnner" do
      @game.add_move(@player[1], 4)
      @game.add_move(@player[1], 5)
      @game.add_move(@player[1], 6)
      expect(@game.check_winner).to eq true
    end

    it "checks for a 3rd row horizontal winnner" do
      @game.add_move(@player[1], 7)
      @game.add_move(@player[1], 8)
      @game.add_move(@player[1], 9)
      expect(@game.check_winner).to eq true
    end

    it "checks for a 1st column vertical winnner" do
      @game.add_move(@player[1], 1)
      @game.add_move(@player[1], 4)
      @game.add_move(@player[1], 7)
      expect(@game.check_winner).to eq true
    end

    it "checks for a 2nd column vertical winnner" do
      @game.add_move(@player[1], 2)
      @game.add_move(@player[1], 5)
      @game.add_move(@player[1], 8)
      expect(@game.check_winner).to eq true
    end

    it "checks for a 3rd column vertical winnner" do
      @game.add_move(@player[1], 3)
      @game.add_move(@player[1], 6)
      @game.add_move(@player[1], 9)
      expect(@game.check_winner).to eq true
    end

    it "checks for a / diagonal winnner" do
      @game.add_move(@player[1], 3)
      @game.add_move(@player[1], 5)
      @game.add_move(@player[1], 7)
      expect(@game.check_winner).to eq true
    end

    it "checks for a \ diagonal winnner" do
      @game.add_move(@player[1], 1)
      @game.add_move(@player[1], 5)
      @game.add_move(@player[1], 9)
      expect(@game.check_winner).to eq true
    end

    it "prints player designations in color" do
      @game.grid.add_move("X", 5)
      @game.grid.add_move("O", 9)
      @game.print_color_grid
      # What assertion (other than looking at the printout) works here?
    end
  end
end
