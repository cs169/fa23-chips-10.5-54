Feature: Map Functionality

  @load-seed-data @US49
  Scenario: Visiting the national map page
    Given I am on the map page
    Then I should see the map of the United States

  @load-seed-data @US49
  Scenario: Visiting a county map page
    Given I am on the "CA" state page
    When I click the button Counties in California
    Then I should see "Alameda County"

  @load-seed-data @US49
  Scenario: Visiting representatives1
    Given I am on the "CA" state page
    When I click the button Counties in California
    Then I should see "Butte County"
    When I click the button view Butte County
    Then I should be on Butte Representatives page
    Then I should see "Table of Representatives"
    And I should see "Butte County"
    And I should see "Leondra R. Kruger"
    And I should not see "Contra Costa County"

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
    When I am on the create article page
    Then I should see "Add News Article"