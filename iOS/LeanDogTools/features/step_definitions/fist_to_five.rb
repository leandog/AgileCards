Given /^I choose to see the "Fist to 5" deck$/ do
  sleep 5
  on(HomePage).fist_to_5
  sleep 5
end

Then /^I see the Fist to 5 "Rules of the Game"$/ do
  pending
end
