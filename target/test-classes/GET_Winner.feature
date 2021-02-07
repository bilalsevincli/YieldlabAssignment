@wip
Feature: User should be able to get the winner

  # Verifies that Auction Response returns Winning Bid which is the highest one - No Query Parameter
  Scenario Outline: GET the winner and verify - No Query Parameter
    When User sends GET request to "<id>" endpoint
    Then User gets status code as 200
    And Response body returns winner bid


    Examples:
      | id |
      | 1  |
      | 2  |
      | 3  |
      | 4  |
      | 5  |
      | 6  |

  # Verifies that Auction Response returns Winning Bid which is the highest one - 1 Query Parameter
  Scenario Outline: GET the winner and verify - 1 Query Parameter
    When User sends GET request to "<id>" endpoint "<key1>" "<value1>"
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1>


    Examples:
      | id | key1 | value1 |
      | 1  | a    | 3      |
      | 2  | b    | 2      |
      | 3  | c    | 1      |
      | 4  | c    | 7      |
      | 5  | a    | 2      |
      | 6  | b    | 4      |

  # Verifies that Auction Response returns Winning Bid which is the highest one - 2 Query Parameters
  Scenario Outline: GET the winner and verify - 2 Query Parameters
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2>
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2>


    Examples:
      | id | key1 | value1 | key2 | value2 |
      | 1  | a    | 3      | b    | 4      |
      | 2  | b    | 2      | a    | 2      |
      | 3  | c    | 1      | b    | 6      |
      | 4  | c    | 7      | a    | 3      |
      | 5  | a    | 9      | c    | 2      |
      | 6  | b    | 4      | a    | 9      |

  # Verifies that Auction Response returns Winning Bid which is the highest one - 3 Query Parameters
  Scenario Outline: GET the winner and verify - 3 Query Parameters
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>


    Examples:
      | id | key1 | value1 | key2 | value2 | key3 | value3 |
      | 1  | a    | 3      | b    | 4      | c    | 5      |
      | 2  | b    | 2      | a    | 2      | c    | 9      |
      | 3  | c    | 1      | b    | 6      | a    | 6      |
      | 4  | c    | 7      | a    | 3      | b    | 7      |
      | 5  | a    | 9      | c    | 2      | b    | 1      |
      | 6  | b    | 4      | a    | 9      | c    | 2      |

  # Verifies that Auction Response returns Winning Bid which is the highest one even in case of 2 same highest bids - 2 Query Parameters
  Scenario Outline: GET the winner and verify - 2 Same Highest Bids - 2 Query Parameters
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2>
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2>
    And Response body returns winner bidder as "<key1>" or "<key2>"


    Examples:
      | id | key1 | value1 | key2 | value2 |
      | 1  | a    | 10     | b    | 6      |
      | 2  | b    | 3      | a    | 5      |
      | 3  | c    | 2      | b    | 4      |
      | 4  | c    | 3      | a    | 10     |
      | 5  | a    | 20     | c    | 6      |
      | 6  | b    | 1      | c    | 2      |

  # Verifies that Auction Response returns Winning Bid which is the highest one even in case of 2 same highest bids - 3 Query Parameters
  Scenario Outline: GET the winner and verify - 2 Same Highest Bids - 3 Query Parameters
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    And Response body returns winner bidder as "<key1>" or "<key2>"

    Examples:
      | id | key1 | value1 | key2 | value2 | key3 | value3 |
      | 1  | a    | 10     | b    | 6      | c    | 1      |
      | 2  | b    | 3      | a    | 5      | c    | 1      |
      | 3  | c    | 2      | b    | 4      | a    | 3      |
      | 4  | c    | 3      | a    | 10     | b    | 4      |
      | 5  | a    | 20     | c    | 6      | b    | 5      |
      | 6  | b    | 4      | c    | 2      | a    | 6      |

  # Verifies that Auction Response returns Winning Bid which is the highest one even in case of 3 same highest bids - 3 Query Parameters
  Scenario Outline: GET the winner and verify - 3 Same Highest Bids - 3 Query Parameters
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    And Response body returns winner bidder as "<key1>" or "<key2>" or "<key3>"

    Examples:
      | id | key1 | value1 | key2 | value2 | key3 | value3 |
      | 1  | a    | 10     | b    | 6      | c    | 3      |
      | 2  | b    | 12     | c    | 6      | a    | 20     |

  # Verifies that Auction Response returns Winning Bid which is the highest one
  # even in case of 2 same highest bids and winner bidder is chosen randomly - 2 Query Parameters
  Scenario Outline: GET the winner and verify - 2 Same Highest Bids - 2 Query Parameters - Verify Random Selection
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> for Random Test
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2>
    And Response body should return winner bidder randomly  as "<key1>" or "<key2>"

    Examples:
      | id | key1 | value1 | key2 | value2 |
      | 1  | a    | 10     | b    | 6      |
      | 2  | b    | 6      | c    | 3      |
      | 3  | c    | 2      | b    | 4      |

  # Verifies that Auction Response returns Winning Bid which is the highest one
  # even in case of 3 same highest bids and winner bidder is chosen randomly- 3 Query Parameters
  Scenario Outline: GET the winner and verify - 3 Same Highest Bids - 3 Query Parameters - Verify Random Selection
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> "<key3>" <value3> for Random Test
    Then User gets status code as 200
    And Response body returns winner bid "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    And Response body should return winner bidder randomly as "<key1>" or "<key2>" or "<key3>"

    Examples:
      | id | key1 | value1 | key2 | value2 | key3 | value3 |
      | 1  | a    | 10     | b    | 6      | c    | 3      |
      | 2  | b    | 12     | c    | 6      | a    | 20     |
      | 3  | c    | 9      | a    | 30     | b    | 18     |

  #Verifies that response body contains 'No valid bids' message if there are no valid bids provided as query parameters
  Scenario Outline: GET request returns 'No valid bids' if there are no valid bids
    When User sends GET request to "<id>" endpoint "<key1>" <value1> "<key2>" <value2> "<key3>" <value3>
    Then Response body contains "No valid bids"

    Examples:
      | id | key1 | value1 | key2 | value2 | key3 | value3 |
      | 1  | a    | -10    | b    | -6     | c    | -3     |
      | 2  | b    | -12    | c    | -6     | a    | -20    |
      | 3  | c    | -9     | a    | -30    | b    | -18    |