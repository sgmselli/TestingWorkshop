Feature: Useful Page

Scenario: Page is useful form is visible
    Given I navigate to the homepage
    And I should see the homepage
    And I should see the page useful form 

Scenario: Click yes for page is useful
    Given I navigate to the homepage
    And I should see the homepage
    And I should see the page useful form
    And I should see a yes button
    When I click the yes button
    Then A thank you for your response message appears

Scenario: Click no for page is useful
    Given I navigate to the homepage
    And I should see the homepage
    And I should see the page useful form
    And I should see a no button
    When I click the no button
    Then A help us improve GOV.UK message appearts

Scenario: Report a problem with the page
    Given I navigate to the homepage
    And I should see the homepage
    And I should see the page useful form
    And I should see a report button
    When I click report button
    Then a report form shows
    And I input tester123 in what were you doing field
    And I input tester456 in what went wrong field
    And I click Send
    Then A thank you for your response message appears
