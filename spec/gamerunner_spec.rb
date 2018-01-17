require 'gamerunner'

describe GameRunner do
  context "entry point for the TTT game" do
    before do
      @bunch_of_input_moves = StringIO.new('123456789')
      @bunch_of_output = StringIO.new
      $stdin = @bunch_of_input_moves
      $stdout = @bunch_of_output
      @thisgamerunner = GameRunner.new
      @players = @thisgamerunner.player
    end

    it "can choose a move using AI" do

    end

    it "can start the game with human vs droid" do
      game_with_droid = GameRunner.new(:droid)
      expect(game_with_droid.player[1].type).to eq :droid
    end

    it "stops the game after all squares have been occupied" do
      grid = Grid.new
      player = Player.new("O", :droid)
      grid.add_move("X", 1)  # XOO
      grid.add_move("O", 3)  # OXX
      grid.add_move("X", 7)  # XXO
      grid.add_move("O", 4)  #
      grid.add_move("X", 5)
      grid.add_move("O", 2)
      grid.add_move("X", 6)
      grid.add_move("O", 9)
      grid.add_move("X", 8)
      expect(grid.moves_remaining).to eq 0
    end

    it "changes the state of the grid with each turn" do
      grid_state_1 = @thisgamerunner.grid.dupe
      @thisgamerunner.next_turn
      grid_state_2 = @thisgamerunner.grid
      expect(grid_state_1 == grid_state_2).to eq false
    end

    it "creates a game with player named 'X'" do
      expect(@thisgamerunner.player[0].designation).to eq "X"
    end

    it "creates a game with player named 'O'" do
      expect(@thisgamerunner.player[1].designation).to eq "O"
    end

    it "stores the state of the game" do
      currentgrid = @thisgamerunner.grid
      expect(currentgrid.contents).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "receives a move and stores it" do
      player = @players[0]
      move = @bunch_of_input_moves.getc.to_i
      @thisgamerunner.grid.add_move(player.designation, move)
      expect(@thisgamerunner.grid.contents).to eq [ 0, "X", 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "will quit the game if the move is 'Q'" do
      quit_string = StringIO.new
      quit_string.puts("Q")
      quit_string.rewind
      $stdin = quit_string
      @thisgamerunner.next_turn
      expect(@thisgamerunner.is_active).to eq false
    end

#     it "can tell if X has won the game" do
#       player = @players[0]
#       winning_moves_for_x = StringIO.new('15293')
# 
#       while !@thisgamerunner.grid.who_won do
#         move = winning_moves_for_x.getc.to_i
#         @thisgamerunner.grid.add_move(player, move)
#       end
# 
#       expect(@thisgamerunner.grid.who_won).to eq "X"
#     end

    it "alternates players with each turn" do
      mover1 = @thisgamerunner.mover
      @thisgamerunner.next_turn
      mover2 = @thisgamerunner.mover
      expect(mover1).not_to eq mover2
    end
  end
end
