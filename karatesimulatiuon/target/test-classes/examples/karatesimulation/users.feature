Feature: Karatesimulation test

 Background:
   * url 'https://reqres.in/api'
   Scenario:
     Get the user data from server
     Given path '/users?page=2'
     When method get
     And status 200
     * print response