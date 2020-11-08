Feature: Udemy Search functionality
  As a user
  I want to use udemy search
  So I can get relevant courses

  Background:
    Given I visit the Udemy homepage
  
  @manual
  Scenario: The Search box is displayed
    Then I see the search box is displayed
  
  @automated
  Scenario: Verify the search box metadata
    Then I see a search icon is displayed in the box
    And I see the placeholder text displayed in the box
  
  @manual
  Scenario Outline: Relevant search results are displayed
    When I search for <searched_course> in the search box
    Then I see a dropdown opens
    And I see the search results contain the text <searched_course>

    Examples: of searched courses
      | searched_course |
      | python          |
      | google cloud    |
      | docker          |
      | selenium        |
      | jenkins         |
    
    @automated
    Scenario: Navigation to results page on pressing Return Key
      When I search for "pytest" in the search box
      Then I navigate to the "pytest" results page
    
    @manual
    Scenario: Maximum suggestions in the dropdown
      When I search for "jenkins" in the search box
      Then I see "12" search results in the dropdown
    
    @manual
    Scenario: No dropdown when special characters entered
      When I enter special characters in the search box
      Then I do not see the dropdown open
    
    @manual
    Scenario: Navigation on selecting return key with special characters
      When I enter special characters in the search box
      Then I navigate to a fallback results page
    
    @manual
    Scenario: Verify minimum characters to render dropdown
      When I enter two characters in the search box
      Then I see a dropdown opens
    
    @manual
    Scenario: Dropdown disappears on clearing search
      When I enter two characters in the search box
      And I clear the characters
      Then I do not see the dropdown open
    
    @manual
    Scenario: Selecting the search icon in the box
      When I select the search icon
      Then I see the page refreshes
