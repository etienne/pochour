Feature: Manage users
  In order to have a minimal coercitive apparatus in case people do stupid things and I want to keep the site nice and clean
  As an administrator
  I want to be able to create, edit and delete users
  
  Scenario: Show list of users
    Given I am logged in as an administrator
    And I have the following user records:
      | name                   | email               | password  |
      | Herman Toothrot        | herman@toothrot.net | whatpants |
      | Throatwobbler Mangrove | mangrove@wobble.com | yoyoyo    |
      | Raymond Luxury Yacht   | ray@luxyacht.com    | tropcrazy |
    When I go to the users page
    Then I should see "Herman Toothrot"
    And I should see "Throatwobbler Mangrove"
    And I should see "Raymond Luxury Yacht"
  

  
