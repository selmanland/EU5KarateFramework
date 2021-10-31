/*Feature:

  Background:
    * def baseUrl = 'https://api.exchangeratesapi.io'
    * def spartanUrl = 'http://54.90.49.91:8000'
    * def hrUrl = 'http://54.90.49.91:1000/ords/hr'

  Scenario:Welcome to fight club
    Given print "hello world"
    When def name = "kazim"
    Then print name

  Scenario: new Student
    * def student = [{"name":"Tom","age":27},{"gender":"femail","department_id":2}]
    * print student[1]
    * print student[0].name
    * match student[0].age == 27

  Scenario: Spartan is coming
    * def spartan =
  """
    {
    "id": 10,
    "name": "Lorenza",
    "gender": "Female",
    "phone": 3312820936
}
    """
    * print spartan
    * print spartan.phone

  Scenario: Country is selected
    * def country =
  """
       {
            "country_id": "AR",
            "country_name": "Argentina",
            "region_id": 2,
            "links": [
                {
                    "rel": "self",
                    "href": "http://54.90.49.91:1000/ords/hr/countries/AR"
                }
                ]
                }
      """
    * print country.links[0].href
    * match country.country_id == "AR"
    * match country.country_id == "#string"
    * match country.region_id == "#number"
    * def length =  country.length
    * print length


  Scenario: Jsont header and body verification
    Given url "https://api.exchangeratesapi.io/2010-01-12"
    When method get
    And match header Connection == "keep-alive"
    Then status 200
    And match response.success == false
    And print response.error.code
    And match response.error.type == "missing_access_key"


  Scenario: Country is selected
    * def country =
  """
       {
            "country_id": "AR",
            "country_name": "Argentina",
            "region_id": 2,
            "links": [
                {
                    "rel": "self",
                    "href": "http://54.90.49.91:1000/ords/hr/countries/AR"
                }
                ]
                }
      """
    * print country.links[0].href
    * match country.country_id == "AR"
    * match country.country_id == "#string"
    * match country.region_id == "#number"
    * def length =  country.length
    * print length


  Scenario: Jsont header and body verification
    Given url "https://api.exchangeratesapi.io/2010-01-12"
    When method get
    And match header Connection == "keep-alive"
    Then status 200
    And match response.success == false
    And print response.error.code


  Scenario expected and actual
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
    Then status 200
    And print response


* */package utilities;

public class store {
}
