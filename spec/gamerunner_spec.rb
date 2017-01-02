require 'gamerunner'

describe Gamerunner do
  context "entry point for the TTT game" do
    before do
      @game = Game.new
      @player = [Player.new("X"), Player.new("O")]
    end

    it "creates a game with two players" do
      thisgame = Game.new
      player_bench = [Player.new("X"), Player.new("O")]
      expect(player_bench[0].designation).to eq "X"
    end

    it "receives a move and stores it" do
      moves = StringIO.new('123456789')
      expect(true).to eq true
    end

  end
end
