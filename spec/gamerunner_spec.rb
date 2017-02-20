require 'gamerunner'

describe GameRunner do
  context "entry point for the TTT game" do
    before do
      @bunch_of_input_moves = StringIO.new('123456789')
      @bunch_of_output = StringIO.new
      $stdin = @bunch_of_input_moves
      $stdout = @bunch_of_output
      # Do we really need to set anything up in this case?
      @thisgamerunner = GameRunner.new
      @players = @thisgamerunner.game.player
    end

    it "changes the state of the grid with each turn" do
      grid_state_1 = @thisgamerunner.get_status
      # puts "\ngrid_state_1 = #{grid_state_1}"
      @thisgamerunner.next_turn
      grid_state_2 = @thisgamerunner.get_status
      # puts "\ngrid_state_1 = #{grid_state_1}"
      expect(grid_state_1 == grid_state_2).to eq false
    end

    it "creates a game with player named 'X'" do
      expect(@thisgamerunner.game.player[0].designation).to eq "X"
    end

    it "creates a game with player named 'O'" do
      expect(@thisgamerunner.game.player[1].designation).to eq "O"
    end

    it "stores the state of the game" do
      currentgrid = @thisgamerunner.get_status
      expect(currentgrid).to eq [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "receives a move and stores it" do
      player = @players[0]
      move = @bunch_of_input_moves.getc.to_i
      @thisgamerunner.game.add_move(player, move)
      currentgrid = @thisgamerunner.get_status
      expect(currentgrid).to eq [ 0, "X", 2, 3, 4, 5, 6, 7, 8, 9 ]
    end

    it "will quit the game if the move is 'Q'" do
      quit_string = StringIO.new
      quit_string.puts("Q")
      quit_string.rewind
      $stdin = quit_string
      @thisgamerunner.next_turn
      expect(@thisgamerunner.is_active).to eq false
    end

    it "can tell if X has won the game" do
      player = @players[0]
      winning_moves_for_x = StringIO.new('15293')

      while !@thisgamerunner.game.check_winner do
        move = winning_moves_for_x.getc.to_i
        @thisgamerunner.game.add_move(player, move)
      end

      expect(@thisgamerunner.game.check_winner).to eq true
    end

    it "alternates players with each turn" do
      mover1 = @thisgamerunner.mover
      @thisgamerunner.next_turn
      mover2 = @thisgamerunner.mover
      expect(mover1).not_to eq mover2
    end
  end
end
