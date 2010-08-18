Feature: Manage articles
  In order to have content on the website
  As a user
  I want to be able to create and edit articles
  
  Scenario: User creates a new, valid article
    Given I am logged in as "Roger McMuffin"
    And I am on the home page
    And I follow "Publier un nouvel article"
    And I fill in the following:
      | Titre   | Un article trop cool |
      | Article | C’est fucké là       |
    When I press "Publier"
    Then I should see "Un article trop cool"
    And I should see "C’est fucké là"
    And I should see "Roger McMuffin"
    And I should see "Bravo."
  
  Scenario: User looks at the list of articles on the home page
    Given I have the following article records:
      | title                                         |
      | Des grosses patates chaudes                   |
      | De l’impossibilité de la grosse patate chaude |
      | De l’air salin en présence de patates chaudes |
    When I go to the home page
    Then I should see "Des grosses patates chaudes"
    And I should see "De l’impossibilité de la grosse patate chaude"
    And I should see "De l’air salin en présence de patates chaudes"
