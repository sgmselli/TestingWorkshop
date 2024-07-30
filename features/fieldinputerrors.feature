Feature: Field input errors

Scenario: Shows an error message when a user inputs more than 168 hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input more than 168 hours worked per week
    Then I should see an error message
