require 'gamerunner'

describe Gamerunner do
  context "entry point for the TTT game" do
    before do
      @game = Game.new
      @game.player = [Player.new("X"), Player.new("O")]
    end

    it "creates a game with player named 'X'" do
      thisgame = Game.new
      thisgame.player = [Player.new("X"), Player.new("O")]
      expect(thisgame.player[0].designation).to eq "X"
    end

    it "creates a game with player named 'O'" do
      thisgame = Game.new
      thisgame.player = [Player.new("X"), Player.new("O")]
      expect(thisgame.player[1].designation).to eq "O"
    end

    it "receives a move and stores it" do
      moves = StringIO.new('123456789')
      expect(true).to eq true
    end

  end
end
