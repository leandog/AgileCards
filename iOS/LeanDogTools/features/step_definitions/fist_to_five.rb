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

When /^I swipe left four times$/ do
  pending # express the regexp above with the code you wish you had
end
