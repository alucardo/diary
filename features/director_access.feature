Feature: Managing access to daily
  As a signed in director                             # who
  I want to use classrooms and subject with user      # what
  In order to add, edit classes                       # why

  @javascript
  Scenario: Login to daily as director
    Given I am at the login page
    When I fill login form and submit
    Then I should be redirect to director home page