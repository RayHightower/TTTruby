require 'game'

  describe Game do
    context "orginary game of Tic Tac Toe" do

      before do
        @game = Game.new
        @cells = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
      end

      it "creates a grid with the right number of cells" do
        @game.cells
      end
    end
  end
