Feature: User authentication

  Scenario: User checks in
    Given user is at the check in page
    When user submits new check in
    Then user should be at home page
    And user should see his info

  Scenario: User checks in without specifying the username
    Given user is at the check in page
    When user submits new check in without username
    Then user should stay at check in page
    And user should see message that username must be specified during check in

  Scenario: User visits check in page while she is already checked in
    Given user is checked in
    When user visits check in page
    Then user should be redirected to chat page

