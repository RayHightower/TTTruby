require 'player'

describe Player do
  context "both human and droid" do

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

    it "can flipflop between X and O during recursion" do
      player = Player.new("X", :droid)
      expect(player.flipflop).to eq "O"
    end

    it "can flipflop between O and X during recursion" do
      player = Player.new("O", :droid)
      expect(player.flipflop).to eq "X"
    end

    it "can toggle between X and O more than once" do
      player = Player.new("X", :droid)
      expect(player.opposite.opposite == player.designation).to eq true
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
#   it "grabs a move from the AI, not the console, if the player is a droid" do
#     current_grid = Grid.new
#     current_player = Player.new("X", :droid)
#     move = current_player.get_move(current_grid)
#     expect(move.class == Fixnum).to eq true
#   end

#   it "makes a legal move when given a grid with existing moves" do
#     player = Player.new("O", :droid)
#     grid = Grid.new
#     grid.add_move("O", 1)  # OXO
#     grid.add_move("X", 2)  #
#     grid.add_move("O", 3)  #   X
#     grid.add_move("X", 9)
#     # puts "\n*****************************************\n"
#     # grid.print_color_grid
#     # puts "\n*****************************************\n"
#     allowed = grid.empty_cell_list
#     # puts "\n allowed = #{allowed}"
#     legal_move = player.get_move(grid)
#     # puts "\nallowed = #{allowed} and legal_move = #{legal_move}\n"
#     expect(allowed.include? legal_move).to eq true
#   end

#   it "returns score = 1 when :droid has won" do
#     player = Player.new("O", :droid)
#     grid = Grid.new
#     grid.add_move("O", 1)  # OOO
#     grid.add_move("O", 2)  #
#     grid.add_move("O", 3)  #
#     expect(player.score(grid, player.designation)).to eq 1
#   end

#   it "returns score = -1 when :droid has lost" do
#     player = Player.new("O", :droid)
#     grid = Grid.new
#     grid.add_move("X", 1)  # XXX
#     grid.add_move("X", 2)  #
#     grid.add_move("X", 3)  #
#     expect(player.score(grid, player.designation)).to eq (-1)
#   end

#   it "retuns score = 0 when grid shows a tie game" do
#     player = Player.new("O", :droid)
#     grid = Grid.new
#     grid.add_move("O", 1)  # OXO
#     grid.add_move("X", 2)  # XOX
#     grid.add_move("O", 3)  # XOX
#     grid.add_move("X", 4)  #
#     grid.add_move("O", 5)  #
#     grid.add_move("X", 6)  #
#     grid.add_move("X", 7)  #
#     grid.add_move("O", 8)  #
#     grid.add_move("X", 9)  #
#     expect(player.score(grid, player.designation)).to eq (0)
#   end

    it "returns a blocking horizontal move when given a potential winning board for the opposing player" do
      grid = Grid.new
      grid.add_move("X", 1)  # XX
      grid.add_move("O", 4)  # O
      grid.add_move("X", 7)  # X O
      grid.add_move("O", 9)  #
      grid.add_move("X", 2)
      puts "Printing the grid before we run minimax.\n"
      grid.print_color_grid
      puts "\n*** Grid has been printed. Now starting minimax. ***\n"
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

#   it "returns a winning move when given a potential winning board for the current player" do
#     grid = Grid.new
#     grid.add_move("X", 1)  # XOO
#     grid.add_move("O", 3)  # OX
#     grid.add_move("X", 7)  # X
#     grid.add_move("O", 4)  #
#     grid.add_move("X", 5)
#     grid.add_move("O", 2)
#     player = Player.new("X", :droid)
#     move = player.get_move(grid)
#     expect(move).to eq 9
#   end
  end
end
