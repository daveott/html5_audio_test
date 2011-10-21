@http://www.pivotaltracker.com/story/show/19906831 @m3u
Feature: User downloads playlist sorted by preferred minimum rating
  In order to organize my playlist
  As a user viewing the list of mp3's
  I want to download a playlist sorted by preferred minimum rating

  Select order by minimum rating
  Click download playlist
  Browser prompts me to save playlist to my computer

  Scenario:
    Given I am on the dashboard page
    When I follow "MP3's"
    And I select "Rating >=" from "Order by"
    And I select "3" from "playlist_rating"
    And I press "Download playlist"
    Then I should not get a "400" response
