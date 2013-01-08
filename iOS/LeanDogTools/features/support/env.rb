require 'rspec-expectations'
require 'frank-cucumber'
require 'furter'

Frank::Cucumber::FrankHelper.use_shelley_from_now_on

World(Furter::Navigation)
