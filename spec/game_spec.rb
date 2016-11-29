require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
    end

    it "prints the grid with the current cell contents" do
      @game.print_status
    end
  end
end
