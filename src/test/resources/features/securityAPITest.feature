@Test
Feature: API Test Security Section

  
  Scenario: Create token with valid username and password.
    #prepare request
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    #Send request
    When method post
    #Validating response
    Then status 200
    And print response

  #Scenario one
  Scenario: validate token with invalid user name
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervis","password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert  response.errorMessage == "User not found"

  #Scenario two
  Scenario: validate token with invalid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor56b"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"
    And assert response.httpStatus == "BAD_REQUEST"
