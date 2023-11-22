Feature: Map Functionality
  As a user
  I want to view maps of the United States, states, and counties
  So that I can get geographical information

  Scenario: Visiting the national map page
    Given I am on the map page
    Then I should see the map of the United States
