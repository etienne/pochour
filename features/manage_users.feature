Feature: Manage users
  In order to have a minimal coercitive apparatus in case people do stupid things and I want to keep the site nice and clean
  As an administrator
  I want to be able to create, edit and delete users
  
  Scenario Outline: Show or hide list of users
    Given I am <user>
    And there are the following user records:
      | name                   | email               | password  |
      | Herman Toothrot        | herman@toothrot.net | whatpants |
      | Throatwobbler Mangrove | mangrove@wobble.com | yoyoyo    |
      | Raymond Luxury Yacht   | ray@luxyacht.com    | tropcrazy |
    When I go to the users page
    Then I should <action> "Herman Toothrot"
    And I should <action> "Throatwobbler Mangrove"
    And I should <action> "Raymond Luxury Yacht"
  
  Examples:
    | user                          | action  |
    | logged in as an administrator | see     |
    | logged in as a user           | not see |
    | not logged in                 | not see |


  
  