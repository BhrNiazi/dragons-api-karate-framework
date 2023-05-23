@Regression
Feature: Create Account Test

Background:  API Test Setup
* def result = callonce read('GenerateToken.feature')
And print result
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create Account 
Given path "/api/accounts/add-primary-account"
When header Authorization = "Bearer " + generatedToken
And request
"""
{
  
  "email": "Bahar5@teksckool.us",
  "firstName": "Bahara",
  "lastName": "Niazi",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "Tester",
  "dateOfBirth": "2001-05-11",
  
}

""" 
When method post
Then status 201
And print response
And assert response.email == "Bahar5@teksckool.us"
#Delete account
Given path "/api/accounts/delete-account/"
When header Authorization = "Bearer " + generatedToken
And param primaryPersonId = response.id
When method Delete
Then status 200
And print response

