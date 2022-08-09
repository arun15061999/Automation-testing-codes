Feature: sample karate test script

  Background:
    * url 'https://gorest.co.in'
    * header Content-Type = 'application/json'
* def requestpayload = read('request.json')
   
  Scenario: get all users and then get the first user by id
    Given path 'public/v2/users'
    Given header Authentication = 'Bearer ' + TokenID
    When method get
    Then status 200
    * print response
    * def first = response[0]
    Given path 'users', first.id
    * print first.id


  Scenario: get a single users and then get the name
    Given path 'public/v2/users/3933'
    Given header Authentication = 'Bearer ' + TokenID
    When method get
    Then status 200
    * print response
    * print response.name

  Scenario: create a user and then get it by id

    Given path 'public/v2/users'
    Given header Authorization = 'Bearer ' +TokenID
    And request {"name": "TestUser2","email": "test2@user.com","gender": "male","status": "inactive"}
    When method post
    Then status 201
#    And request user
    * print response
    * def id = response.id
    * print 'created id is: ', id
    * print response

    Scenario: Update the single user data
      Given path '/public/v2/users/3941'
      Given header Authorization = 'Bearer ' +TokenID
      And request {"name": "kaira","email": "kaira@user.com","gender": "female","status": "active"}
      When method put
      Then status 200
      * print response

  Scenario: Update the single user data
    Given path '/public/v2/users/3928'
    Given header Authorization = 'Bearer ' +TokenID
    When method delete
    Then status 204

    Scenario: create the user using read the json file
      Given path '/public/v2/users/3933'
      And request requestpayload
      Given header Authorization = 'Bearer ' +TokenID
      When method put
      Then status 200
      * print response