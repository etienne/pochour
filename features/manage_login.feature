Feature: Manage login
  In order to have better content
  As some guy who makes a weird website
  I want authors to identify themselves and hopefully publish more good stuff and less junk

  Scenario: User creates an account
    Given I am not logged in
    When I go to the home page
    And I follow "Créer un compte"
    And I fill in the following:
      | user_email                 | whatever@example.com |
      | user_password              | whatever             |
      | user_password_confirmation | whatever             |
      | user_name                  | John Whatever        |
    And I press "Devenir cool"
    Then I should be on to the home page
    And I should not see "Créer un compte"
    And I should see "Bravo."
    And I should see "John Whatever"
