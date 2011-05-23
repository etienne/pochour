Feature: Read articles
  In order to access good content and be happy
  As a visitor
  I want to be able to read articles
  
  Scenario: Visitor looks at the list of articles on the home page and follows a link
    Given the following articles exist:
      | Title                                         | Body               | Abstract               |
      | Des grosses patates chaudes                   | Malade ton article | J'ai un abstract cool. |
      | De l’impossibilité de la grosse patate chaude | Fucké tes affaires |                        |
      | De l’air salin en présence de patates chaudes | Spécial ta chose   |                        |
    When I go to the home page
    Then I should see "Des grosses patates chaudes"
    And I should see "J'ai un abstract cool."
    And I should not see "Malade ton article"
    And I should see "De l’impossibilité de la grosse patate chaude"
    And I should see "De l’air salin en présence de patates chaudes"
    When I follow "Des grosses patates chaudes"
    Then I should see "Des grosses patates chaudes"
    And I should see "Malade ton article"

  Scenario: Visitor looks at list of articles by a specific author
    Given the following users exist:
      | Name              |
      | Roger Sansfaçon   |
      | Albert Lemuscadet |
    Given the following articles exist:
      | Title                            | User                    |
      | Comment voyager avec un saumon   | Name: Roger Sansfaçon   |
      | Comment voyager avec une truite  | Name: Roger Sansfaçon   |
      | La vengeance de la patate chaude | Name: Albert Lemuscadet |
    And I am on the article page "Comment voyager avec un saumon"
    When I follow "Roger Sansfaçon"
    Then I should see "Roger Sansfaçon"
    And I should see "Comment voyager avec un saumon"
    And I should not see "La vengeance de la patate chaude"
    And I should not see "Roger Sansfaçon" within the list of articles
