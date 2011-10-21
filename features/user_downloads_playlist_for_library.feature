@http://www.pivotaltracker.com/story/show/19904803 @m3u
Feature: User downloads playlist for library
  In order to listen to easily shuffle though songs
  As a user viewing the mp3 list
  I want to download a playlist of all songs in the library

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
