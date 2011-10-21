@http://www.pivotaltracker.com/story/show/19906707 @m3u
Feature: User downloads playlist sorted by artist name
  In order to organize my playlist
  As a user viewing the list of mp3's
  I want to download a playlist sorted by artist name

  Select order by artist name
  Click download playlist
  Browser prompts me to save playlist to my computer

  Scenario:
    Given the following mp3s:
      | title     |
      | Civilians |
      | Reverie   |
    And I am on the dashboard page
    When I follow "MP3's"
    And I select "Artist name" from "Order by"
    And I press "Download playlist"
    Then I should not get a "400" response
