require 'gamerunner'

describe Gamerunner do
  context "entry point for the TTT game" do
    before do

    end

    it "creates a game with player named 'X'" do
      thisgamerunner = Gamerunner.new
      expect(thisgamerunner.game.player[0].designation).to eq "X"
    end

    it "creates a game with player named 'O'" do
      thisgamerunner = Gamerunner.new
      expect(thisgamerunner.game.player[1].designation).to eq "O"
    end

    it "receives a move and stores it" do
      moves = StringIO.new('123456789')
      expect(true).to eq false
    end

  end
end
