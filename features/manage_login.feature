Feature: Manage login
  In order to have better content
  As some guy who makes a weird website
  I want authors to identify themselves and hopefully publish more good stuff and less junk

  Scenario: Visitor creates a new account
    Given I am not logged in
    When I go to the home page
    And I follow "Inscrivez-vous"
    And I fill in the following:
      | user_email                 | whatever@example.com |
      | user_password              | whatever             |
      | user_password_confirmation | whatever             |
      | user_name                  | John Whatever        |
    And I press "Devenir cool"
    Then I should be on to the home page
    And I should see "Bravo."
    And I should be logged in as "John Whatever"
  
  Scenario: Member logs out
    Given I am logged in
    When I log out
    Then I should be on the home page
    And I should see "Ciao."
    And I should see "Ça faut un compte pour écrire un article."
  
  Scenario: Member logs in
    Given I am not logged in
    And I have one user "Steve Fields" with email "steve@fields.com" and password "voujvou"
    When I go to the home page
    And I fill in the following:
      | user_email    | steve@fields.com |
      | user_password | voujvou          |
    And I press "Connectation"
    Then I should be on the home page
    And I should see "Salut."
    And I should be logged in as "Steve Fields"
