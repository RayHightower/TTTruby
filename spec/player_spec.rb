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
      @player[0].designation = "X"
      expect(@player[0].designation).to eq "X"
    end

    it "chooses letter 'O' for the second player" do
      puts "@player[1].name = #{@player[1].name}"
      @player[1].designation = "O"
      expect(@player[1].designation).to eq "O"
    end
  end
end
