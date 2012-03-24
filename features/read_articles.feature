Feature: Read articles
  In order to access good content and be happy
  As a visitor
  I want to be able to read articles
  
  Scenario: Visitor looks at the list of articles on the home page and follows a link
    Given the following articles exist:
      | Title                                         | Body               | Abstract               | Draft |
      | Des grosses patates chaudes                   | Malade ton article | J'ai un abstract cool. | false |
      | De l’impossibilité de la grosse patate chaude | Fucké tes affaires |                        | false |
      | De l’air salin en présence de patates chaudes | Spécial ta chose   |                        | false |
      | Patates et onions, même combat                | Prout              |                        | true  |
    When I go to the home page
    Then I should see "Des grosses patates chaudes"
    And I should see "J'ai un abstract cool."
    And I should not see "Malade ton article"
    And I should see "De l’impossibilité de la grosse patate chaude"
    And I should see "De l’air salin en présence de patates chaudes"
    And I should not see "Patates et onions, même combat"
    When I follow "Des grosses patates chaudes"
    Then I should see "Des grosses patates chaudes"
    And I should see "Malade ton article"

  Scenario: Visitor looks at list of articles by a specific author
    Given the following users exist:
      | Name              |
      | Roger Sansfaçon   |
      | Albert Lemuscadet |
    Given the following articles exist:
      | Title                            | User                    | Draft |
      | Comment voyager avec un saumon   | Name: Roger Sansfaçon   | false |
      | Comment voyager avec une truite  | Name: Roger Sansfaçon   | true  |
      | La vengeance de la patate chaude | Name: Albert Lemuscadet | false |
    And I am on the article page "Comment voyager avec un saumon"
    When I follow "Roger Sansfaçon"
    Then I should see "Roger Sansfaçon"
    And I should see "Comment voyager avec un saumon"
    And I should not see "Comment voyager avec une truite"
    And I should not see "La vengeance de la patate chaude"
    And I should not see "Roger Sansfaçon" within the list of articles

  Scenario: View article with an image
    Given there is an article titled "I am imageful"
    And article "I am imageful" has an image attached
    When I go to the article page "I am imageful"
    Then I should see an image at the top of the article
  
  Scenario: View article without an image
    Given there is an article titled "I am not imageful"
    When I go to the article page "I am not imageful"
    Then I should not see an image at the top of the article
  
  
  
  