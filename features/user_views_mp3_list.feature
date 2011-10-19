@http://www.pivotaltracker.com/story/show/19869523 @mp3
Feature: User views mp3 list
  In order to create playlists
  As a user viewing my dashboard
  I want to view a listing of all mp3's

  I click MP3's
  For each mp3 I see
  -url
  -title
  -artist name
  -length in seconds

  Scenario:
    Given the following artist:
      | first name | Joe   |
      | last name  | Henry |
    And that artist has the following mp3:
      | url    | http://mp3.com/civilians.mp3 |
      | title  | Civilians                    |
      | length | 240                          |
    And I am on the dashboard page
    When I follow "MP3's"
    Then I should see the following table:
      | Title     | Artist    | URL                          | Length      |
      | Civilians | Joe Henry | http://mp3.com/civilians.mp3 | 240 seconds |
