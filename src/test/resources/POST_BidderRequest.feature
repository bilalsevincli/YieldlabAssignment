@wip
Feature: User should be able to get proper response from POST Request

  # Verifies that Bid Response for A returns details of the Bid
  Scenario Outline: POST for A Positive Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port A
    Then User gets status code as 200
    And Response body is as expected for A "<id>" "<a>" "<b>" "<c>"

    Examples:
      | id | a | b | c |
      | 1  | 8 | 6 | 4 |
      | 2  | 4 | 7 | 1 |
      | 3  | 7 | 7 | 8 |
      | 4  | 3 | 9 | 1 |


  #Verifies that status code 500 in case of invalid value for Bid A
  Scenario Outline: POST for A Negative Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port A
    Then User gets status code as 500

    Examples:
      | id | a   | b | c |
      | 1  |     | 6 | 4 |
      | 2  | str |   | 1 |
      | 3  | ++# | 7 |   |
      | 4  | 9,8 | 9 | 1 |


  # Verifies that Bid Response for B returns details of the Bid
  Scenario Outline: POST for B Positive Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port B
    Then User gets status code as 200
    And Response body is as expected for B "<id>" "<a>" "<b>" "<c>"

    Examples:
      | id | a | b | c |
      | 1  | 8 | 6 | 4 |
      | 2  | 4 | 7 | 1 |
      | 3  | 7 | 7 | 8 |
      | 4  | 3 | 9 | 1 |


  #Verifies that status code 500 in case of invalid value for Bid B
  Scenario Outline: POST for B Negative Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port B
    Then User gets status code as 500

    Examples:
      | id | a | b    | c |
      | 1  | 8 |      | 4 |
      | 2  | 4 | str  | 1 |
      | 3  | 7 | +-+- | 8 |
      | 4  | 3 | 44,7 | 1 |


  # Verifies that Bid Response for C returns details of the Bid
  Scenario Outline: POST for C Positive Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port C
    Then User gets status code as 200
    And Response body is as expected for C "<id>" "<a>" "<b>" "<c>"

    Examples:
      | id | a | b | c |
      | 1  | 8 | 6 | 4 |
      | 2  | 4 | 7 | 1 |
      | 3  | 7 | 7 | 8 |
      | 4  | 3 | 9 | 1 |


  #Verifies that status code 500 in case of invalid value for Bid C
  Scenario Outline: POST for C Negative Testing
    Given User creates a json body using "<id>" "<a>" "<b>" "<c>"
    When User sends POST request to Bidder Port C
    Then User gets status code as 500

    Examples:
      | id | a | b | c    |
      | 1  | 8 | 6 | 7,64 |
      | 2  | 4 | 7 | STR  |
      | 3  | 7 | 7 | $$$  |
      | 4  | 3 | 9 |      |






