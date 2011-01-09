Feature: Read articles
  In order to access good content and be happy
  As a visitor
  I want to be able to read articles
  
  Scenario: Visitor looks at the list of articles on the home page and follows a link
    Given there are the following article records:
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
