Given /^I choose to see the "Fist to 5" deck$/ do
  on(HomePage).fist_to_5
end

Then /^I see the Fist to 5 "Rules of the Game"$/ do
  on(FistTo5).instruction_card_view.should be_visible
end
