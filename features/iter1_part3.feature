Feature: Map Functionality

  @load-seed-data @US49
  Scenario: Visiting representatives2
    Given I am on the "NY" state page
    When I click the button Counties in New York
    Then I should see "Erie County"
    When I click the button view Erie County
    Then I should be on Erie Representatives page
    Then I should see "Table of Representatives"
    And I should see "Erie County"
    And I should see "Joseph R. Biden"
    And I should not see "Leondra R. Kruger"