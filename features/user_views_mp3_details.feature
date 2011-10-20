@http://www.pivotaltracker.com/story/show/19890093 @mp3
Feature: User views mp3 details
  In order to decide if I want to listen to an mp3
  As a user viewing the mp3 list
  I want to view details about a particular mp3

  I click mp3 title
  I see
  -URL
  -Title
  -Artist
  -Length in seconds

  Scenario:
    Given the following artist:
      | first name | Joe   |
      | last name  | Henry |
    And that artist has the following mp3:
      | title  | Civilians                    |
      | url    | http://mp3.com/civilians.mp3 |
      | length | 123456                       |
    And I am on the dashboard page
    When I follow "MP3's"
    And I follow "Civilians"
    Then I should see "Civilians" in the "Title" section
    And I should see "Joe Henry" in the "Artist" section
    And I should see "http://mp3.com/civilians.mp3" in the "URL" section
    And I should see "123456" in the "Length in seconds" section
