require 'player'

describe Player do
  context "create TTT players and make sure they behave" do

    before do
      @player = []
      @player[0] = Player.new
      @player[1] = Player.new
    end

    it "passes this test no matter what happens" do
      true
    end

    it "chooses letter 'X' for the first player" do
      puts "@player[0].name = #{@player[0].name}"
      expect(@player[0].designation).to eq "X"
    end
  end
end
