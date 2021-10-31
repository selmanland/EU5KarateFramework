Feature: Karate Java Integration

  Background:
    * def spartanUrl = 'http://54.90.49.91:8000'

  Scenario: Get a spartan with request header
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    When method GET
    Then status 200


  Scenario: Create a new spartan
    Given  url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
    {
        "gender": "Female",
         "name": "Lorenza",
         "phone": 3123781237
    }
    """
    When method POST
    Then status 201
    And print response
## my


  Scenario: Create another spartan
    Given url 'http://54.90.49.91:8000'
    And path '/api/spartans'
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request
    """
      {
        "gender": "Male",
         "name": "Menza",
         "phone": 3123781248
    }
    """
    When method POST
    Then status 201
    And print response.name



  Scenario: reading java methods
     #point the class that we want to run
     #Java.type --> used to connect to java class
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    #      json         map
     #run the static method in that class and capture the result
     #the return map object is represented as a json
    * print newSpartan


  Scenario: Create a spartan with Random Data (JAVA)
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given  url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
        #verify names
    And match response.data.name == newSpartan.name

  Scenario: Create a spartan with Random Data (JAVA) and delete
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given  url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
        #verify names
    And match response.data.name == newSpartan.name
    And def idToDelete = response.data.id
    Given url spartanUrl
    And path 'api/spartans',idToDelete
    When method DELETE
    Then status 204
## My reviews
  Scenario: Create new spartan
    * def Spartan = "Java.type('utilities.SpartanDataGenerator')"
    * def newSpartan = Spartan.createSpartan()
    Given url spartanUrl
    And path 'api/spartans'
    And header Accept = "application/json"
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And match response.name == newSpartan.name