Feature: representative's profile

  @load-seed-data @US49
  Scenario: access representative's profile from search
    When I visit the representatives search page
    And I search with a New Mexico address
    And I click on Martin Heinrich's profile in the search results
    Then I should see 'Martin Heinrich'
    And I should see 'ocd-division/country:us/state:nm'
    And I should see 'U.S. Senator'
    And I should see '303, Washington, DC 20510'
    And I should see 'Democratic Party'
    And I should see Martin Heinrich's photo
