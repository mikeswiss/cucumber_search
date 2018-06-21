Feature: Searching for Paxos

  as a user of google search
  I want to be able to get search results for Paxos Bankchain
  So any potential customer can get information about Paxos Bankchain

  Scenario: Search Paxos
    Given I am on the Google Homepage
    When I search for "Paxos Bankchain"
    Then the url should contain "Paxos Bankchain"
    And the search results should contain "Paxos"

  Scenario: Ticker Check
    Given a "XBTUSD" currency pair
    When I search the api for the currency
    Then the currency should be returned in the results
