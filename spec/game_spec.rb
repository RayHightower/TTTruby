require 'game'

describe Game do
  context "orginary game of Tic Tac Toe" do

    before do
      @game = Game.new
    end

    it "stores the status of the cells in the grid" do
      @game.get_status

    end
  end
end
