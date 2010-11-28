Feature: Assign epithets to articles
  In order to expressively describe content
  As a user
  I want to be able to tag articles with epithets
  
  Scenario: User assigns a new epithet to an article
    Given I am logged in
    And there is an article titled "Bouettisme"
    And I am on the article page "Bouettisme"
    When I fill in "epithet_name" with "trop cool"
    And I press "Procéder"
    Then I should be on the article page "Bouettisme"
    And I should not see "trop cool"
    And I should see "Vous êtes la première personne à utiliser cet épithète."
    
  @wip
  Scenario: User assigns an existing epithet to an article
    Given I am logged in
    And there is an article titled "Bouettisme"
    And there is an approved epithet called "prodigieux"
    And I am on the article page "Bouettisme"
    When I fill in "epithet_name" with "prodigieux"
    And I press "Procéder"
    Then I should be on the article page "Bouettisme"
    And I should see "prodigieux"
    And I should not see "Vous êtes la première personne à utiliser cet épithète."
