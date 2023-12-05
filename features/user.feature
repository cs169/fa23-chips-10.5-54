Feature: User model
  As a developer
  I want to ensure the User model works correctly

  Scenario: Unique uid and provider combination
    Given a user exists with uid "12345" and provider "google_oauth2"
    When I try to create a user with uid "12345" and provider "google_oauth2"
    Then I should see a uniqueness validation error

  Scenario: Full name method
    Given a user exists with first name "John" and last name "Doe"
    When I check the user's full name
    Then I should see "John Doe"

  Scenario: Authentication provider method
    Given a user exists with provider "google_oauth2"
    When I check the user's authentication provider
    Then I should see "Google"
