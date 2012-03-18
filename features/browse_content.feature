Feature: Browse content
  In order to be happy
  As an user
  I want to be able to easily browse content
  
  Scenario: Pick a user from a list on the home page to view articles
    Given the following users exist:
      | Name              |
      | Roger Sansfaçon   |
      | Albert Lemuscadet |
    And I am on the home page
    When I select "Roger Sansfaçon" from the users list
    And I press "Voir les articles"
    Then I should be on the user page "Roger Sansfaçon"
  
