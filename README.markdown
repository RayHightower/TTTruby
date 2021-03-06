TTTruby
===

Experiment with TTT in Ruby.

## Setup

1. Install Ruby v2.3.2. [RVM works well](http://rayhightower.com/blog/2013/05/16/upgrading-ruby-with-rvm/) for managing Ruby versions.
1. Run `$ gem install bundler` so that dependencies can be managed automatically.
1. Run `$ bundle install` to install dependencies like `rspec`, `rspec-core`, `guard`, and `guard-rspec`. Note that `guard` and `guard-rspec` are optional, but they make the red/green/refactor experience most pleasurable!
1. Run `$ rspec` at the root of the project to run all of the tests.
1. Run `$ bundle exec guard` at the root of the project to make the tests run automatically every time a file is changed.

## Running the Program

To run the program from the root directory, do one of the following:

* `$ ./ttt`

 -- OR --

* `$ ruby ./lib/main.rb`
