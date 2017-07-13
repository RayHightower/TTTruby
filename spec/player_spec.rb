require 'player'

describe Player do
  context "both human and droid" do

    before do
      @player = [Player.new("X"), Player.new("O")]
    end

    it "can flip strings because we monkey patched the String class" do
      sample_designation = "X"
      expect(sample_designation.flipxo).to eq "O"
    end

    it "can handle an incorrect designation when flipping strings" do
      sample_designation = "Q"
      expect(sample_designation.flipxo).to eq "Invalid"
    end

    it "can accomodate human players and droids" do
      new_player = Player.new("X", :droid)
      expect(new_player.type == :droid).to eq true
    end
  end

  context "human" do
    it "grabs a move from the console if the player is a human" do
      $stdin = StringIO.new("2543798")
      current_grid = Grid.new
      current_player = Player.new("X", :human)
      move = current_player.get_move(current_grid)
      expect(move == 2).to eq true
    end
  end

  context "droid" do
    it "returns a winning (diagonal) move when given a potential winning board for the current player" do
      grid = Grid.new
      grid.add_move("X", 1)  # XOO
      grid.add_move("O", 3)  # OX
      grid.add_move("X", 7)  # X
      grid.add_move("O", 4)  #
      grid.add_move("X", 5)
      grid.add_move("O", 2)
      player = Player.new("X", :droid)
      move = player.get_move(grid)
      expect(move).to eq 9
    end

    it "returns a winning (horizontal or diagonal) move when given a potential winning board for the current player" do
      grid = Grid.new
      grid.add_move("X", 1)  # XOO
      grid.add_move("O", 3)  # O
      grid.add_move("X", 7)  # X X
      grid.add_move("O", 4)  #
      grid.add_move("X", 9)
      grid.add_move("O", 2)
      player = Player.new("X", :droid)
      move = player.get_move(grid)
      expect(move == 5 || move == 8).to eq true
    end

    it "returns a winning move (O) when given a potential winning board for the current player" do
      grid = Grid.new
      grid.add_move("X", 1)  # XOX
      grid.add_move("O", 2)  # XO
      grid.add_move("X", 3)  #
      grid.add_move("O", 5)  #
      grid.add_move("X", 4)
      player = Player.new("O", :droid)
      move = player.get_move(grid)
      expect(move).to eq 8
    end

    it "grabs a move from the AI, not the console, if the player is a droid" do
      current_grid = Grid.new
      current_player = Player.new("X", :droid)
      move = current_player.get_move(current_grid)
      expect(move.class == Fixnum).to eq true
    end

    it "makes a legal move when given a grid with existing moves" do
      player = Player.new("O", :droid)
      grid = Grid.new
      grid.add_move("X", 1)  # XOX
      grid.add_move("O", 2)  #  X
      grid.add_move("X", 3)  #   O
      grid.add_move("O", 9)
      grid.add_move("X", 5)
      allowed = grid.empty_cell_list
      new_grid = grid.dupe
      legal_move = player.get_move(grid)
      grid.add_move(player.designation, legal_move)
      expect(allowed.include? legal_move).to eq true
    end

    it "returns score = 999 when :droid has won" do
      player = Player.new("O", :droid)
      grid = Grid.new
      depth = 1
      grid.add_move("O", 1)  # OOO
      grid.add_move("O", 2)  #
      grid.add_move("O", 3)  #
      lookahead_remaining = 0
      expect(player.score(grid, player.designation, lookahead_remaining)).to eq 999
    end

    it "returns score = -999 when :droid has lost" do
      player = Player.new("O", :droid)
      grid = Grid.new
      grid.add_move("X", 1)  # XXX
      depth = 1
      grid.add_move("X", 2)  #
      grid.add_move("X", 3)  #
      lookahead_remaining = 0
      expect(player.score(grid, player.designation, lookahead_remaining)).to eq -999
    end

    it "retuns score = 0 when grid shows a tie game" do
      player = Player.new("O", :droid)
      grid = Grid.new
      depth = 1
      grid.add_move("O", 1)  # OXO
      grid.add_move("X", 2)  # XOX
      grid.add_move("O", 3)  # XOX
      grid.add_move("X", 4)  #
      grid.add_move("O", 5)  #
      grid.add_move("X", 6)  #
      grid.add_move("X", 7)  #
      grid.add_move("O", 8)  #
      grid.add_move("X", 9)  #
      lookahead_remaining = 0
      expect(player.score(grid, player.designation, lookahead_remaining)).to eq (0)
    end

    it "returns a blocking horizontal move when given a potential winning board for the opposing player" do
      grid = Grid.new
      grid.add_move("X", 1)  # XX
      grid.add_move("O", 4)  # O
      grid.add_move("X", 7)  # X O
      grid.add_move("O", 9)  #
      grid.add_move("X", 2)
      # grid.print_color_grid
      player = Player.new("O", :droid)
      move = player.get_move(grid)
      expect(move).to eq 3
    end

#   it "returns a blocking diagonal move when given a potential winning board for the opposing player" do
#     grid = Grid.new
#     grid.add_move("X", 1)  # X O
#     grid.add_move("O", 3)  # OX
#     grid.add_move("X", 7)  # X
#     grid.add_move("O", 4)  #
#     grid.add_move("X", 5)
#     player = Player.new("O", :droid)
#     move = player.get_move(grid)
#     expect(move).to eq 9
#   end

#   it "returns a blocking vertical move when given a potential winning board for the opposing player" do
#     grid = Grid.new
#     grid.add_move("X", 1)  # X O
#     grid.add_move("O", 3)  # OX
#     grid.add_move("X", 7)  # X O
#     grid.add_move("O", 4)  #
#     grid.add_move("X", 5)
#     player = Player.new("X", :droid)
#     move = player.get_move(grid)
#     expect(move).to eq 6
#   end

  end
end
