require 'artificial_player'
# Artificial Player will make the best available move based on the minimax algorithm.

describe ArtificialPlayer do
  context "provide the best move from available choices" do
    before do
      @art = ArtificialPlayer.new
      @allowed_moves = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "gives a move when we ask for a move" do
      # This is a throwaway test. 
      move = @art.get_move
      expect(@allowed_moves.include? move).to eq true
    end

    it "returns an integer when given a board & current player" do

      move = minimax(@current_grid, @current_player)

    end

  end
end
