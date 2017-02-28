require 'player'

describe Player do
  context "TTT player" do

    before do
      @player = [Player.new("X"), Player.new("O")]
    end

    # This test feels funky because it's testing a method that exists in the grid class.
    it "calculates the number of moves remaining on any given grid" do
      test_grid = Grid.new
      test_grid.contents = [ 0, "O", 2, 3, 4, "X", 6, 7, "X", 9 ]
      expect(test_grid.moves_remaining(test_grid)).to eq 6
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

    it "grabs a move from the console if the player is a human" do
      $stdin = StringIO.new("2543798")
      current_grid = Grid.new
      current_player = Player.new("X", :human)
      move = current_player.get_move(current_grid)
      expect(move == 2).to eq true
    end

    it "grabs a move from the AI if the player is a droid" do
      current_grid = Grid.new
      current_player = Player.new("X", :droid)
      move = current_player.get_move(current_grid)
      expect(move.class == Fixnum).to eq true
    end

    it "returns an integer when given a board" do
      current_grid = Grid.new
      current_grid.contents = [ 0, "X", 2, 3, 4, 5, 6, 7, 8, 9 ]
      current_player = Player.new("O", :droid)
      ideal_moves = [ 2, 3, 4, 5, 6, 7, 8, 9 ]
      move = current_player.get_move(current_grid)
      expect(ideal_moves.include? move).to eq true
    end

    it "returns a non-losing move when given a potential winning board for the opposing player" do
      current_grid = Grid.new
      current_grid.contents = [ 0, "X", "X", 3, "O", 5, 6, 7, 8, "O" ]
      current_player = Player.new("O", :droid)
      move = current_player.get_move(current_grid)
      expect(move).to eq 5
    end

    it "returns a winning move when given a potential winning board for the current player" do

    end
  end
end
