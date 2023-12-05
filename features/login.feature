Feature: User Login

  @load-seed-data @US49
  Scenario: Logging in with Google
    Given I am on the login page
    When I click the botton "Sign in with Google"
    Then Redirect to home page

  @load-seed-data @US49
  Scenario: Logging out
    When I am on the login page
    When I click the botton "Sign in with Google"
    Then I will log out

  @load-seed-data @US49
  Scenario: Logging in with Github
    When I am on the login page
    When I click the botton "Sign in with GitHub"
    Then Redirect to home page

  @load-seed-data @US49
  Scenario: Logging out
    When I am on the login page
    When I click the botton "Sign in with GitHub"
    Then I will log out