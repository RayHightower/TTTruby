require 'main'

describe GameRunner do

  context "the TTT game starts here" do

    it "can start the game with human vs droid" do
      game_with_droid = GameRunner.new(:droid)
      expect(game_with_droid.player[1].type).to eq :droid
    end

  end

end
