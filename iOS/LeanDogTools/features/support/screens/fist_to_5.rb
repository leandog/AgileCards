class FistTo5
  include Furter

  view :instruction_card, :label => 'fist_0'

  class <<self
    include Frank::Cucumber::FrankHelper
  end
  def self.current_page
    x_offset = frankly_map('view:"UIScrollView"', 'contentOffset').first["x"]
    page_width = frankly_map('view:"UIScrollView"', 'frame').first["size"]["width"]
    (x_offset / page_width).to_i
  end

  class Card
    include Frank::Cucumber::FrankHelper

    def initialize(which)
      @which = which
    end

    def visible?
      FistTo5.current_page == @which
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

  def swipe_left
    from = 'view:"UIScrollView"'
    frame = accessibility_frame(from)

    # We don't have access to very useful primitives, and PublicAutomation seems to work
    # around the scroll view's snapping to page boundaries, so this is approximate.
    frankly_map(from, 'FEX_dragWithInitialDelayToX:y:', 0, frame.center.y)
    sleep 0.3
    frankly_map(from, 'FEX_dragWithInitialDelayToX:y:', 0, frame.center.y)
    sleep 0.3
    frankly_map(from, 'FEX_dragWithInitialDelayToX:y:', frame.center.x / 4 * 3, frame.center.y)
    sleep 0.3
  end

end
