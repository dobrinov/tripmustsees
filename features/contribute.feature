@omniauth_test
Feature: Contribute with content
  In order to gain more content
  As a user
  I want to be able to suggest countries, cities and locations

  Scenario: Contribute when no countries and cities exist
    Given I am an authenticated user
    And I am on the "/contribute" page
    When I click on the "Suggest location" button
    Then I should go to the first step of the contribution flow
    When I type in a non existing country name
    Then I should see no country results
    And I should see a button for adding new country
    When I click on the "add new country" button
    Then I should see a new country form
    When I fill in the new country form
    And I submit the new country form
    Then I should go to the secont step of the contributions flow
    And the new country should be selected
    When I type in a non existing city name
    Then I should see no city results
    And I should see a button for adding new city
    When I click on the "add new city" button
    Then I should see a new city form
    When I fill in the new city form
    And I submit the new city form
    Then I should go to the third step of the contributions flow
    And the new city should be selected
    When I fill in the new location form
    And I submit the new location form
    Then I should see a list containing the new location

  Scenario: Contribute when the country exist but no cities exist
    Given I am an authenticated user

  Scenario: Contribute when the country and the city exist
    Given I am an authenticated user
