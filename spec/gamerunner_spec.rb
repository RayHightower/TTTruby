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
      winning_moves_for_x = StringIO.new('15293')
      expect(@thisgamerunner.game.check_winner).to eq true
    end

  end
end
