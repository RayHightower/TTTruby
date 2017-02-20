require 'artificial_player'
# Artificial Player will make the best available move based on the minimax algorithm.

describe ArtificialPlayer do
  context "provide the best move from available choices" do
    before do
      @allowed_moves = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "gives a move when we ask for a move" do
      # This is a throwaway test.
      art = ArtificialPlayer.new("X")
      move = art.get_move
      expect(@allowed_moves.include? move).to eq true
    end

    it "returns an integer when given a board" do
      current_grid = Grid.new
      current_grid = [ 0, "X", 2, 3, 4, 5, 6, 7, 8, 9 ]
      current_player = ArtificialPlayer.new("O")
      ideal_moves = [ 2, 3, 4, 5, 6, 7, 8, 9 ]
      move = current_player.minimax(current_grid)
      expect(ideal_moves.include? move).to eq true
    end

    it "returns a non-losing move when given a potential winning board for the opposing player" do
      current_grid = Grid.new
      current_grid = [ 0, "X", "X", 3, "O", 5, 6, 7, 8, "O" ]
      current_player = ArtificialPlayer.new("O")
      move = current_player.minimax(current_grid)
      expect(move).to eq 3
    end

    it "returns a winning move when given a potential winning board for the current player" do

    end


  end
end
