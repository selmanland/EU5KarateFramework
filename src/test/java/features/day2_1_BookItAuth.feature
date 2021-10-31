Feature: get user token
  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'sbirdbj@fc2.com'
    And param password = 'asenorval'
    When method GET
    Then status 200
    And print response.accessToken
    And def token = response.accessToken
    And def name = 'steven'

  @token
  Scenario: get token
      Given url 'https://cybertek-reservation-api-qa2.herokuapp.com/sign'
      And param email = 'sbirdbj@fc2.com'
      And param password = 'asenorval'
      When method GET
      Then status 200
      And def token = response.accessToken
      And def name = 'sam'
      And print name
      And print token