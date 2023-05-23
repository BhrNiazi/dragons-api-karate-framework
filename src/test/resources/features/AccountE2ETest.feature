# End 2 End Account Testing.
# Create account
# Add Address
# Add Phone 
# Add Car
# Get Account
@Regression
Feature: End 2 End Account Testing
Background: 
* def result = callonce read('GenerateToken.feature')
* def generatedToken = result.response.token
Given url "https://tek-insurance-api.azurewebsites.net"

Scenario: Create an Account add Address Phone Car and get the account
* def generatedData = Java.type ("api.data.GenerateData")
* def autoEmail = generatedData.getEmail()
Given path "/api/accounts/add-primary-account"
Then header Authorization = "Bearer " + generatedToken
And request 
"""
{
  
  "email": "#(autoEmail)",
  "firstName": "Bhr",
  "lastName": "Niazi",
  "title": "Ms.",
  "gender": "FEMALE",
  "maritalStatus": "SINGLE",
  "employmentStatus": "student",
  "dateOfBirth": "2001-26-11",
  
}
"""
And method post
And status 201
And print response
* def id = response.id
And print id
And assert response.email == autoEmail

# Add Address
Given path "api/accounts/add-account-address"
Then header Authorization = "Bearer " + generatedToken
And param primaryPersonId = id
And request
"""
{
  "id": "",
  "addressType": "Home",
  "addressLine1": "12991",
  "city": "Woodbridge",
  "state": "Virginia",
  "postalCode": "22192",
  "countryCode": "345",
  "current": true
}
"""
And method post
And status 201
And print response
And assert response.addressLine1 == "12991"

# add phone 
Given path "api/accounts/add-account-phone"
Then header Authorization = "Bearer " + generatedToken
And param primaryPersonId = id
Then request 
"""
{
  "id": "",
  "phoneNumber": "5714567898",
  "phoneExtension": "",
  "phoneTime": "Morning",
  "phoneType": "Home"
}
 """
And method post
And status 201
And print response
And assert response.phoneNumber == "5714567898"

# add car 
Given path "api/accounts/add-account-car"
Then header Authorization = "Bearer " + generatedToken
And param primaryPersonId = id
Then request 
"""
{
   "id": 0,
  "make": "Toyota",
  "model": "camery",
  "year": "2013",
  "licensePlate": "1234gh"
}
 """
And method post
And status 201
And print response
And assert response.make == "Toyota"

# Get Account
Given path "api/accounts/get-primary-account"
Then header Authorization = "Bearer " + generatedToken
And param primaryPersonId = id
And method get
And status 200
And print response