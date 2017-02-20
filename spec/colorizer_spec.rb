require 'colorizer'

describe Colorizer do

  include Colorizer # Gotta include the modlue

  context "apply color to text" do
    before do

    end

    it "passes this test no matter what" do
      expect true
    end

    it "accepts text plus a color code and returns an escape string that can be printed in color" do
      # How do we test something like this other than by looking at it?
    end
  end
end
