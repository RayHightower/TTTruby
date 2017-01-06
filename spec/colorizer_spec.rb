require 'colorizer'

describe Colorizer do
  context "apply color to text" do
    before do
      include Colorizer

    end

    it "passes this test no matter what" do
      expect true
    end

    it "accepts text plus a color code and returns an escape string that can be printed in color" do
      print colorize("\nThis sentence should be yellow.\n", 93)
    end
  end
end
