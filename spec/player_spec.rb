require 'player'

describe Player do
  context "TTT player" do

    before do
      @player = [Player.new("X"), Player.new("O")]
    end

    it "can toggle between X and O during the recursion" do
      player = Player.new("X", :droid)
      expect(player.toggle(player.designation)).to eq "O"
    end

    it "can toggle between O and X during the recursion" do
      player = Player.new("O", :droid)
      expect(player.toggle(player.designation)).to eq "X"
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

    it "returns score = 1 when :droid has won" do
      player = Player.new("O", :droid)
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("O", 2)
      grid.add_move("O", 3)
      expect(player.score(grid)).to eq 1
    end

    it "returns score = -1 when :droid has lost" do
      player = Player.new("O", :droid)
      grid = Grid.new
      grid.add_move("X", 1)
      grid.add_move("X", 2)
      grid.add_move("X", 3)
      expect(player.score(grid)).to eq (-1)
    end

    it "retuns score = 0 when :droid is in a tie game" do
      player = Player.new("O", :droid)
      grid = Grid.new
      grid.add_move("O", 1)
      grid.add_move("X", 2)
      grid.add_move("O", 3)
      grid.add_move("X", 4)
      grid.add_move("O", 5)
      grid.add_move("X", 6)
      grid.add_move("X", 7)
      grid.add_move("O", 8)
      grid.add_move("X", 9)
      expect(player.score(grid)).to eq (0)
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
