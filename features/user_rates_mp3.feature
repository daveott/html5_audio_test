@http://www.pivotaltracker.com/story/show/19889795 @mp3 @ratings
Feature: User rates mp3
  In order to provide community feedback about an mp3
  As a user listening to an mp3
  I want to rate that mp3

  -Have a place to provide rating for mp3
  Possible ratings are 1 - 5
  Click rate
  Rating average reflects new rating

  Scenario:
    Given the following mp3:
      | title | Civilians |
    And I am on the dashboard page
    When I follow "MP3's"
    And I follow "Civilians"
    And I choose "4"
    And I press "Rate"
    Then I should see "4" in the "Average rating" section
