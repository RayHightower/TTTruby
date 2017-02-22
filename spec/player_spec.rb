require 'player'

describe Player do
  context "TTT players" do

    before do
      @player = [Player.new("X"), Player.new("O")]
    end

    it "chooses letter 'X' for the first player" do
      @player[0].designation = "X"
      expect(@player[0].designation).to eq "X"
    end

    it "chooses letter 'O' for the second player" do
      @player[1].designation = "O"
      expect(@player[1].designation).to eq "O"
    end

    it "can accomodate human players and droids" do
      new_player = Player.new("X", :droid)
      expect(new_player.type == :droid).to eq true
    end

    it "grabs a move from the AI if the player is a droid" do
      new_player = Player.new("X", :droid)

    end
  end
end
