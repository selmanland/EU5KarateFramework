Feature:  Parameters examples

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.90.49.91:8000'
    * def hrUrl = 'http://54.90.49.91:1000/ords/hr'

  Scenario: path parameters
    Given url baseUrl
    And path "latest"
    When method get
    Then status 200

  Scenario: path parameters
    Given url baseUrl
    And path "2010-01-12"
    When method get
    Then status 200

  Scenario: get all spartans with path
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response

  Scenario: get ones spartan only
    Given url spartanUrl
    And path "api/spartans"
    And path "10"
    When method get
    Then status 200
    And print response
    And match response == { "gender": "Female", "phone": 3312820936, "name": "Lorenza", "id": 10}

  Scenario: get ones spartan only
    * def expectedSpartan =
    """
    {
        "gender": "Female",
         "phone": 3312820936,
         "name": "Lorenza",
         "id": 10
    }
    """
    Given url spartanUrl
    And path "api/spartans"
    And path "10"
    When method get
    Then status 200
    And print response
    And match response == expectedSpartan


  Scenario:  query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And match response.pageable.pageNumber == 0
      #verify each content has gender = Female
    And match each response.content contains {"gender":"Female"}
      #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == 'Jinny'
      #verify each content phone is number
    And match each response.content[*].phone == '#number'


  Scenario: hr regions example
    Given url hrUrl
    And path 'regions'
    When method GET
    Then status 200
    And print response
    And match response.limit == 25
    And match each response.items[*].region_id == '#number'

   ## my reviews

  Scenario: expected and actual Spartans
    * def expectedSpartan =
    """
    {
    "id": 1,
    "name": "Meade",
    "gender": "Male",
    "phone": 3584128232
}
    """
    Given url spartanUrl
    And path 'api/spartans'
    And path '1'
    When method get
    And match header Connection == 'keep-alive'
    Then status 200
    And print response
    And match header Content-Type == 'application/json'
    And match response.name == 'Meade'
    And match response == expectedSpartan
  Scenario:  query parameters
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    When method get
    And print each response.content[*].gender == "Female"
    And match each response.content[*].phone == "#number"
   #And match each response.content contains {"gender":"Female"}



















