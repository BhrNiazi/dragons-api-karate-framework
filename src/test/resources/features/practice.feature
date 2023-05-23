@Regression
Feature: Creating new account

  Background: 
    When url "https://tek-insurance-api.azurewebsites.net"

  Scenario: create new account with valid username and password
    When path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    And method post
    Then status 200
    And print response
    * def generatedToken = response.token
    When path "/api/accounts/add-primary-account"
    Then param id = 1234
    Then body email = "bahara@gmail.com"
    Then body firstName = "Bahara"
    Then body lastName = "Niazi"
    Then body title: "Ms",
    Then body gender: "FEMALE",
    Then body maritalStatus: "SINGLE",
    Then body employmentStatus: "Tester",
    Then body  dateOfBirth: "2001-05-11",
    Then body new: "true
    When header Authorization = "Bearer " + generatedToken 
    When method post
    And status 200
    And print response