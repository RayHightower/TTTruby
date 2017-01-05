require 'gamerunner'

describe GameRunner do
  context "entry point for the TTT game" do
    before do
      # Do we really need to set anything up in this case?
    end

    it "creates a game with player named 'X'" do
      thisgamerunner = GameRunner.new
      expect(thisgamerunner.game.player[0].designation).to eq "X"
    end

    it "creates a game with player named 'O'" do
      thisgamerunner = GameRunner.new
      expect(thisgamerunner.game.player[1].designation).to eq "O"
    end

    it "stores the state of the game" do
      thisgamerunner = GameRunner.new
      currentgrid = thisgamerunner.get_status
      expect(currentgrid).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "can tell if X has won the game" do

    end

    it "receives a move and stores it" do
      moves = StringIO.new('123456789')
      expect(true).to eq false
    end

  end
end
