Feature: Get Account API

  #Scenario 9:
  #Endpoint = /api/accounts/get-account
  #For primaryPersonId = <One of your accounts already Created
  #Make sure email address is correct.
  #And header Authorization = "Bearer " + response.token
  Background: API Setup Steps
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get Account Api Call With Existing Account
    Given path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    # def step is to define a new variable in karate framework
    * def generatedToken = response.token
    Given path "/api/accounts/get-account"
    And param primaryPersonId = 6867
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
