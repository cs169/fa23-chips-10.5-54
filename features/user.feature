Feature: User model

  @load-seed-data @US49
  Scenario: Unique uid and provider combination
    Given a user exists with uid "12345" and provider "google_oauth2"
    When I try to create a user with uid "12345" and provider "google_oauth2"
    Then I should see a uniqueness validation error