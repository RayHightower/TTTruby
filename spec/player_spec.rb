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
      puts "@player[0].designation = #{@player[0].designation}"
      expect(@player[0].designation).to eq "X"
    end

    it "chooses letter 'O' for the second player" do
      @player[1].designation = "O"
      puts "@player[1].designation = #{@player[1].designation}"
      expect(@player[1].designation).to eq "O"
    end

    it "gets legal moves between 1 and 9" do
      move = @player[0].get_move
      expect(move).to be_between(1, 9).inclusive
    end

    it "will not choose a cell that has already been moved upon" do

    end
  end
end
