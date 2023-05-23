@Smoke @Regression
Feature: Token Verify Test

Background:  
When url "https://tek-insurance-api.azurewebsites.net"

Scenario: Verify Valid Token
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response
Given path "/api/token/verify"
And param token = response.token
And param username = "supervisor"
When method get
Then status 200
And print response
And assert response == "true"

Scenario: Nevigate Test Validate Token Varify With Wrong Username
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response
Given path "/api/token/verify"
And param token = response.token
And param username = "wrongUsername"
When method get
Then status 400
And print response
And assert response.errorMessage == "Wrong Username send along with Token"


Scenario: Nevigate Test Verify Token with invalid token and valid username 
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response
Given path "/api/token/verify"
And param token = "123"
And param username = "supervisor"
When method get
Then status 400
And print response
#And assert response.errorMessage == "Token Expired or Invalid Token "




  