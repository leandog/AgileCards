Feature: Fist to Five
  So I can make my team function more smoothly,
  As an agilista,
  I want to know how to use fist-to-five.

  Scenario: Getting the directions
    Given I choose to see the "Fist to 5" deck
    Then I see the "Rules" card

  Scenario: Swiping to next card
    Given I choose to see the "Fist to 5" deck
    Then I see the "Rules" card
    And I do not see the "3/Okay" card
    When I swipe left 4 times
    Then I see the "3/Okay" card
    And I do not see the "Rules" card
