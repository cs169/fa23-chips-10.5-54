Feature: Edit News Item

  @load-seed-data @US49
  Scenario: add new news article
    Given I am on the login page
    When I click the button "Sign in with Google"
    Then Redirect to home page
    When I am on the "NY" state page
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
    When I click Add News Article
    Then I should see "Edit News Item"
    When I select "Joseph R. Biden" and "Racism"
    When I click the button "Search"
    Then I should see "Representative: Joseph R. Biden"
    When I choose the Betye Saar Reassembles the Lives of Black Women
    When I click the button "Save"
    Then I should see "https://www.npr.org/sections/health-shots/2023/12/05/1217148407/black-americans-racism-health-care"
    Then I should not see "A Black Physician Takes on Racism in Medicine"
    Then I should not see "The Far Right Is Loving Elon Musk's Comments About Jewish Groups Corrupting 'the West'"
    Then I should not see "Paris Mayor quits Twitter, calls it a 'global sewer'"
    Then I should not see "Oklahoma restricted how race can be taught. So these Black teachers stepped up"
  