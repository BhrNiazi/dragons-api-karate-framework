Feature: create new account

Background:
* def result = callonce read('GenerateToken.feature')
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: creat an account 
Given path "/api/accounts/add-primary-account"
* def generatedData = Java.type("api.data.GenerateData")
* def autoEmail = generatedData.getEmail() 
Then header Authorization = "Bearer " + generatedToken

And request 
"""
{
  
  "email": "#(autoEmail)",
  "firstName": "Bahara",
  "lastName": "Niazi",
  "title": "MS.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "student",
  "dateOfBirth": "2001-11-26",
 
}

"""
And method post
And status 201
And print response
