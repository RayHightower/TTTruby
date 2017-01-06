module Colorizer

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def shoutout
    print colorize("\nTesting yellow.\n", 93)
    print colorize("\nTesting red.\n", 31)
    print colorize("\nTesting blue.\n", 34)
  end
end
