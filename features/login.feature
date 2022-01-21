@ui_case
Feature: UI: HerokuApp: Login

  Background: Going to login
    Given I go to login page

  Scenario: Url Verification
    Then Verify URL is 'http://the-internet.herokuapp.com/'
    And Verify Title is 'Welcome to the-internet'