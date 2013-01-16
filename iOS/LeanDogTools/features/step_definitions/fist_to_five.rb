Given /^I choose to see the "Fist to 5" deck$/ do
  on(HomePage).fist_to_5
end

Then /^I see the Fist to 5 "Rules of the Game"$/ do
  on(FistTo5).instruction_card_view.should be_visible
end

Then /^I see the "(.*?)" card$/ do |name|
  on(FistTo5).card(name).should be_visible
end

Then /^I do not see the "(.*?)" card$/ do |name|
  on(FistTo5).card(name).should_not be_visible
end

When /^I swipe left (\d+) times$/ do |count|
  on(FistTo5) do |screen|
    count.to_i.times do
      screen.swipe_left
    end
  end
end
