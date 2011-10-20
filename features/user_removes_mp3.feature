@http://www.pivotaltracker.com/story/show/19891747 @mp3
Feature: User removes mp3
  In order to cleanup stale files
  As a user viewing details about an mp3
  I want to remove that mp3

  I click remove
  Mp3 is no longer reflected in the system

  Scenario:
    Given the following mp3:
      | title | Civilians |
    When I am on the dashboard page
    And I follow "MP3's"
    And I follow "Civilians"
    And I follow "Remove"
    Then I should not see "Civilians"
