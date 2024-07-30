Feature: Field input errors

Scenario: Shows an error message when a user inputs more than 168 hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 169 hours worked per week
    Then I should see a more than error message

Scenario: Shows an error message when a user inputs less than 0.1 hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input less than 0.1 hours worked per week
    Then I should see a less than error message

Scenario: Shows an error message when a user inputs over maximum of weekly hours worked for days worked
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 168 hours worked per week
    And I input 1 days worked per week
    Then I should see a too many hours error message

Scenario: Shows an error message when a user inputs more than 7 days a week
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 168 hours worked per week
    And I input 8 days worked per week
    Then I should see a too many days error message

Scenario: Shows an error message when a user inputs a leave date that is before employee start date
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for someone leaving part way through a leave year
    And I input 08,07,2024 for the employment end date
    And I input 09,07,2024 for the leave year start
    Then I should see an incorrect early date error message

Scenario: Shows an error message when a user inputs more than 24 hours in a shift
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option shifts
    And I select the option for a full leave year for shift work
    And I input 25 hours for the shifts
    Then I should see an incorrect shift length error message

Scenario: Shows an error message when a user inputs less than 0.5 hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 0.4 hours worked per week
    Then I should see a less than 0.5 error message
    

  













