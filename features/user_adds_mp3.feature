@http://www.pivotaltracker.com/story/show/19882257 @mp3
Feature: User adds mp3
  In order to have content to rate
  As a user viewing the mp3 list
  I want to add an mp3

  Click add mp3
  Have a place to
  -URL
  -Title
  -Artist
  -Mp3 file to upload
  Click submit

  I see mp3 was added to system in a list reflecting
  -URL
  -Title
  -Artist
  -Length in seconds

  Background:
    Given the following artist:
      | first name | Joe   |
      | last name  | Henry |
    And I am on the dashboard page
    And I follow "MP3's"
    And I follow "Add New MP3"
    And I select "Joe Henry" from "Artist"

  Scenario: Success
    When I fill in "Title" with "Civilians"
    And I fill in "URL" with "http://mp3.com/civilians.mp3"
    And I fill in "Length in seconds" with "123456"
    And I press "Add MP3"
    Then I should see "MP3 was successfully saved"
    And I should see "Civilians" in the "Title" section
    And I should see "Joe Henry" in the "Artist" section
    And I should see "http://mp3.com/civilians.mp3" in the "URL" section
    And I should see "123456" in the "Length in seconds" section

  Scenario: Validation
    When I press "Add MP3"
    Then I should see "Title can't be blank"
