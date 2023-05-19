Feature: Get All Plan Code

Background: 
* def result = callonce read('GenerateToken.feature')
Then print result
* def generatedToken = result.response.token 
Given url "https://tek-insurance-api.azurewebsites.net" 

Scenario: Get All Plan Code 
Given path "/api/plans/get-all-plan-code"
And header Authorization = "Bearer " + generatedToken
When method get 
And status 200
And print response
