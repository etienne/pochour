Feature: Manage articles
  In order to have content on the website
  As a user
  I want to be able to create and edit articles
  
  @ignore
  Scenario: Member creates a new, valid article
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
  
  @ignore
  Scenario: Member edits one of their articles
    Given I am logged in as "Arthur Steveson"
    And there is an article titled "Bouettisme" with author "Arthur Steveson"
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
  
  @ignore
  Scenario: Member tries to edit an article which they didn't create
    Given I am logged in as "Klingon Nowhereson"
    And there is an article titled "Bouettisme"
    And I am on the home page
    When I follow "Bouettisme"
    Then I should not see "Modifier cet article"
