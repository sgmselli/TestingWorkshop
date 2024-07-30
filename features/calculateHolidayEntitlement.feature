
Feature: Calculate holiday entitlement

# Scenario: Homepage is visible
#     Given I navigate to the homepage
#     And I should see the homepage

Scenario: Calculate the correct holiday entitlement for an employee who works regular hours
    Given I navigate to the homepage
    And I should see the homepage
    When I click on the 'Start now' button
    And I select the option no for working irregular hours
    And I select the option hours worked per week
    And I select the option for a full leave year
    And I input 37.5 hours worked per week
    And I input 5 days worked per week
    Then I should see the correct submitted answers for regular hours
    And I should see 210 total entitlement hours

# Scenario: Calculate the correct holiday entitlement for an employee who works irregular hours
#     Given I navigate to the homepage
#     And I should see the homepage
#     When I click on the 'Start now' button
#     And I select the option yes for working irregular hours
#     And I input the date 08-07-2024
#     And I input 50 hours worked in the pay period
#     Then I should see the correct submitted answers for irregular hours
#     And I should see 6 total entitlement hours
    
# Scenario: Updates calculation when value is edited
#     Given I navigate to the homepage
#     And I should see the homepage
#     When I click on the 'Start now' button
#     And I select the option no for working irregular hours
#     And I select the option hours worked per week
#     And I select the option for a full leave year
#     And I input 37.5 hours worked per week
#     And I input 5 days worked per week
#     Then I should see the correct submitted answers for regular hours
#     And I should see 210 total entitlement hours
#     When I click the number of hours per week change button
#     And I input 40 hours worked per week
#     And I input 5 days worked per week
#     Then I should see the correct submitted answers for regular hours
#     And I should see 224 total entitlement hours

