@Regression
Feature: Random Account Creation

Background: setup test generated token 
* def tokenFeature = callonce read('GenerateToken.feature') 
* def token = tokenFeature.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create Account With Random Number 
#call java class and method with karate 

* def dataGenerator = Java.type('api.data.GenerateData')
* def autoEmail = dataGenerator.getEmail() 
Given path "/api/accounts/add-primary-account"
When header Authorization = "Bearer " +  token
And request
"""
{
  
  "email": "#(autoEmail)",
  "firstName": "Bahara",
  "lastName": "Niazi",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "Tester",
  "dateOfBirth": "2001-26-11",
  
}

""" 
When method post
Then status 201
And print response
And assert response.email == autoEmail