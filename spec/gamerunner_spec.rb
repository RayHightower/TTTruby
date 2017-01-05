require 'gamerunner'

describe GameRunner do
  context "entry point for the TTT game" do
    before do
      # Do we really need to set anything up in this case?
      @thisgamerunner = GameRunner.new
      @players = @thisgamerunner.game.player
      @bunch_of_moves = StringIO.new('123456789')
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
      move = @bunch_of_moves.getc.to_i
      @thisgamerunner.game.add_move(player, move)
      currentgrid = @thisgamerunner.get_status
      expect(currentgrid).to eq [ 0, "X", 2, 3, 4, 5, 6, 7, 8, 9 ]
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

    it "can take the next turn when you tell it to do so" do
      current_status = @thisgamerunner.get_status
      @thisgamerunner.next_turn
      next_status = @thisgamerunner.get_status
      expect(current_status).not_to eq next_status
    end


    it "can determine whether the game is over" do


    end
  end
end
