class FistTo5
  include Furter

  view :instruction_card, :label => 'fist_0'

  class Card
    include Frank::Cucumber::FrankHelper

    def initialize(which)
      @which = which
    end

    def visible?
      x_offset = frankly_map('view:"UIScrollView"', 'contentOffset').first["x"]
      page_width = frankly_map('view:"UIScrollView"', 'frame').first["size"]["width"]
      current_page = x_offset / page_width

      current_page == @which
    end
  end

  def card(name)
    case name
    when 'Rules'
      Card.new(0)
    when '3/Okay'
      Card.new(4)
    else
      raise "Unknown card named '#{name}'"
    end
  end
end
