# Feature: Manage comments
#   In order to be able to have a conversation about content
#   As a user
#   I want to be able to read and post comments on articles
#   
#   Background:
#     Given there is an article titled "My first english publication"
#   
#   Scenario: Visitor posts a comment
#     Given I am not logged in
#     And I am on the article page "My first english publication"
#     When I fill in the following:
#       | Nom          | Roger Lemuscadet      |
#       | Commentation | J'ai ben aimé ça moi. |
#     And I press "Publier"
#     Then I should be on the article page "My first english publication"
#     And I should see "Roger Lemuscadet" as regular text
#     And I should see "J'ai ben aimé ça moi."
# 
#   Scenario: Visitor posts a comment anonymously
#     Given I am not logged in
#     And I am on the article page "My first english publication"
#     When I fill in "Commentation" with "Je suis complètement anonyme."
#     And I press "Publier"
#     Then I should be on the article page "My first english publication"
#     And I should see "Visiteur stupide et anonyme" as regular text
#     And I should see "Je suis complètement anonyme."
#   
#   Scenario: Member posts a comment
#     Given I am logged in as "G. Roberge"
#     And I am on the article page "My first english publication"
#     When I fill in "Commentation" with "PAS FIN LANDAIS 1820 ROSEMONT"
#     And I press "Publier"
#     Then I should be on the article page "My first english publication"
#     # FIXME: This should use a cleaner selector, like "a link", but for some reason it doesn't work
#     And I should see "G. Roberge" within "dl.comments a"
#     And I should see "PAS FIN LANDAIS 1820 ROSEMONT"
#   
#   Scenario: Member posts a comment using a different name
#     Given I am logged in as "G. Roberge"
#     And I am on the article page "My first english publication"
#     When I fill in the following:
#       | Nom          | Some dudeface                    |
#       | Commentation | Personne ne saura que c’est moi. |
#     And I press "Publier"
#     Then I should be on the article page "My first english publication"
#     And I should see "Some dudeface" as regular text
#     And I should not see "G. Roberge" within the list of comments
#     And I should see "Personne ne saura que c’est moi."
