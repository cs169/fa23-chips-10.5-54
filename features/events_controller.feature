Feature: Event controller
  Scenario: Filtering events by state only
    Given there are events in different states
    When I filter events by state "CA"
    Then I should see events only from the state "CA"

  Scenario: Filtering events by state and county
    Given there are events in different counties
    When I filter events by state "CA" and county "Los Angeles"
    Then I should see events only from "Los Angeles" county in "CA"

  Scenario: Accessing the event show page
    Given there is an event with id "1"
    When I visit the event page with id "1"
    Then I should see details of the event

  # Add scenarios for edge cases
  Scenario: Filtering events with invalid state
    Given there are events
    When I filter events by an invalid state
    Then I should see an appropriate error message

  Scenario: Filtering events with valid state but invalid county
    Given there are events in different states
    When I filter events by state "CA" and an invalid county
    Then I should see an appropriate error message
