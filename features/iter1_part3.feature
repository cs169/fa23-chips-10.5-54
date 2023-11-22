Feature: Map Functionality
  As a user
  I want to view maps of the United States, states, and counties
  So that I can get geographical information

  Scenario: Visiting the national map page
    Given I am on the map page
    Then I should see the map of the United States

  Scenario: Viewing a state map
    Given I am on the "California, CA" state page
    Then I should see a map of "California, CA"

  Scenario: Viewing representatives of a county
    Given I am on the state page for "California, CA"
    When I click on the county "Mono County, CA"
    Then I should see representatives for California, CA