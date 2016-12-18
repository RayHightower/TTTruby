require 'artificial_player'

describe ArtificialPlayer do
  context "artificial player for the TTT game" do

    before do
      @art = ArtificialPlayer.new
      @allowed_moves = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "gives a move when we ask for a move" do
      move = @art.get_move
      expect(@allowed_moves.include? move).to eq true
    end
  end
end
