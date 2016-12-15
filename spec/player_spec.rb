require 'player'

describe Player do
  context "TTT players" do

    before do
      @player = []
      @player[0] = Player.new("X")
      @player[1] = Player.new("O")
    end

    it "passes this test no matter what happens" do
      true
    end

    it "chooses letter 'X' for the first player" do
      @player[0].designation = "X"
      expect(@player[0].designation).to eq "X"
    end

    it "chooses letter 'O' for the second player" do
      @player[1].designation = "O"
      expect(@player[1].designation).to eq "O"
    end
  end
end
