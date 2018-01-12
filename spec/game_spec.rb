require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do
    before do
      @game = Game.new
      @player = [Player.new("X"), Player.new("O")]
      @fake_console = StringIO.new
      $stdout = @fake_console
    end

    it "on initialize, sets grid" do
      game = Game.new
      expect(game.grid).not_to be_nil
    end

    it "adds a move to the grid" do
      expect(@game.grid).to receive(:add_move).with(@player[0].designation, 5)
      @game.add_move(@player[0], 5)
    end

    it "tells us when O wins on the first row" do
      game = Game.new
      game.add_move(@player[0], 1)
      game.add_move(@player[0], 2)
      game.add_move(@player[0], 3)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the second row" do
      game = Game.new
      game.add_move(@player[1], 4)
      game.add_move(@player[1], 5)
      game.add_move(@player[1], 6)
      expect(game.who_won).to eq "O"
    end

    it "tells us when O wins on the third row" do
      game = Game.new
      game.add_move(@player[0], 7)
      game.add_move(@player[0], 8)
      game.add_move(@player[0], 9)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the first column" do
      game = Game.new
      game.add_move(@player[0], 1)
      game.add_move(@player[0], 4)
      game.add_move(@player[0], 7)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the second column" do
      game = Game.new
      game.add_move(@player[0], 2)
      game.add_move(@player[0], 5)
      game.add_move(@player[0], 8)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the third column" do
      game = Game.new
      game.add_move(@player[0], 3)
      game.add_move(@player[0], 6)
      game.add_move(@player[0], 9)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the forward-slash diagonal" do
      game = Game.new
      game.add_move(@player[0], 3)
      game.add_move(@player[0], 5)
      game.add_move(@player[0], 7)
      expect(game.who_won).to eq "X"
    end

    it "tells us when O wins on the back-slash diagonal" do
      game = Game.new
      game.add_move(@player[0], 1)
      game.add_move(@player[0], 5)
      game.add_move(@player[0], 9)
      expect(game.who_won).to eq "X"
    end
  end
end
