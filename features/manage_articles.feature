Feature: Manage articles
  In order to have content on the website
  As a user
  I want to be able to create and edit articles
  
  Scenario: User looks at the list of articles on the home page and follows a link
    Given I have the following article records:
      | title                                         | article            |
      | Des grosses patates chaudes                   | Malade ton article |
      | De l’impossibilité de la grosse patate chaude | Fucké tes affaires |
      | De l’air salin en présence de patates chaudes | Spécial ta chose   |
    When I go to the home page
    Then I should see "Des grosses patates chaudes"
    And I should see "De l’impossibilité de la grosse patate chaude"
    And I should see "De l’air salin en présence de patates chaudes"
    When I follow "Des grosses patates chaudes"
    Then I should see "Des grosses patates chaudes"
    And I should see "Malade ton article"
    
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
  
  Scenario: User creates an article and edits it
    Given I am logged in as "Arthur Steveson"
    And I have an article titled "Bouettisme" with author "Arthur Steveson"
    And I am on the home page
    And I follow "Bouettisme"
    When I follow "Modifier cet article"
    And I fill in the following:
      | Titre   | Un article vraiment trop cool |
      | Article | C’est trop fucké là           |
    And I press "Modifier"
    Then I should see "Un article vraiment trop cool"
    And I should not see "Bouettisme"
    And I should see "C’est trop fucké là"
    And I should see "Bravo."