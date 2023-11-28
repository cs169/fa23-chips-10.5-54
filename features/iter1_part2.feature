Feature: Representative Functionality

  Scenario: Accessing a Representative's Profile
  Given I am on the "Representatives Search" page
  When I click on the name of a representative
  Then I should be redirected to the representative's profile page
  And I should see the representative's name, contact address, political party, and photo

  Scenario: Profile Page Displays Correct Information
  Given I am on a representative's profile page
  Then I should see the representative's name, office, contact address, political party, and photo
  And this information should match the data from the Google Civic Information API

  Scenario: Profile Page Linked from News Items
  Given I am viewing a news item mentioning a representative
  When I click on the representative's name within the news item
  Then I should be redirected to the representative's profile page
  And I should see all the relevant information about the representative

  Scenario: Profile Page Styling
  Given I am on a representative's profile page
  Then the page should be styled using Bootstrap
  And the layout should be clean and user-friendly