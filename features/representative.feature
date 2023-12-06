Feature: representative's profile

  @load-seed-data @US49
  Scenario: access representative's profile from search
    When I visit the representatives search page
    And I search with a New Mexico address
    And I click on Martin Heinrich's profile in the search results
    Then I should see Martin Heinrich's name
    And I should see Martin Heinrich's OCD ID
    And I should see Martin Heinrich's title
    And I should see Martin Heinrich's contact address
    And I should see Martin Heinrich's political party
    And I should see Martin Heinrich's photo