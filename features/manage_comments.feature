Feature: Manage comments
  In order to be able to have a conversation about content
  As a user
  I want to be able to read and post comments on articles
  
  Background:
    Given there is an article titled "My first english publication"
  
  Scenario: Visitor posts a comment
    Given I am not logged in
    And I am on the article page "My first english publication"
    When I fill in the following:
      | Nom          | Roger Lemuscadet      |
      | Commentation | J'ai ben aimé ça moi. |
    And I press "Publier"
    Then I should be on the article page "My first english publication"
    And I should see "Roger Lemuscadet"
    And I should see "J'ai ben aimé ça moi."
  
  Scenario: Member posts a comment
    Given I am logged in as "G. Roberge"
    And I am on the article page "My first english publication"
    When I fill in "Commentation" with "PAS FIN LANDAIS 1820 ROSEMONT"
    And I press "Publier"
    Then I should be on the article page "My first english publication"
    And I should see "G. Roberge"
    And I should see "PAS FIN LANDAIS 1820 ROSEMONT"
  
  
  