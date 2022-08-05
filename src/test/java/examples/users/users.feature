Feature: sample API testing
Background:
* url 'https://reqres.in/api'
  * header Accept = 'application/json'
Scenario:
Get the listed users details
Given path '/users'
  And request {name:'Arun'}
  And request {job: 'Leader'}
When method post
Then status 201
And print response

  Scenario:
    get the data from reqres server
    Given  path ;'/users?2'
    When method get
    Then status 200
    And print response


