@http://www.pivotaltracker.com/story/show/19890017 @mp3 @ratings
Feature: User views average rating for mp3
  In order to see what the community things about an mp3
  As a user viewing details about an mp3
  I want to see it's average rating

  I click on mp3 title
  I see average rating for that mp3

  Scenario:
    Given the following mp3:
      | title | Civilians |
    And that mp3 has the following ratings:
      | score |
      | 4     |
      | 3     |
      | 5     |
      | 5     |
      | 5     |
    And I am on the dashboard page
    When I follow "MP3's"
    And I follow "Civilians"
    Then I should see "4.4" in the "Average rating" section
