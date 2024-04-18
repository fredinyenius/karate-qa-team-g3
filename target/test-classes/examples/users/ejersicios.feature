Feature: Ejercicios clase 02

  Scenario: Caso ! - Consulta usuario por id
    Given url "https://reqres.in/
    And path <string>

  Scenario: Caso 10 - Actualizar Ususario
    * def id = 2
    Given url "https://reqres.in/"
    And path "/api/users/" + id
    And form field name = "morpheus"
    And form field job = "zion resident"
    When method put
    Then status 200
    And match responseType == "json"
    And match $.name == "morpheus"
    And match $.job == "zion resident"


  Scenario: Caso 11 - Actualizar Ususario
    Given url "https://reqres.in/"
    And path "/api/users/" +id
    And request read ( body
    When method put
    Then status 200
    And match responseType == "json"
    And match $.name == "morpheus"
    And match $.job == "zion resident"

  Scenario: Caso 12 - Buscar comentarios por postId
    Given url "https://jsonplaceholder.typicode.com"
    And path "/comments"
    And param postId = "1"
    When method get
    Then status 200

  Scenario: Caso 13 - Crear un post con docString en variable
    * def body =
    """
    {
      'userId': 1,
      'title': 'Post de prueba',
      'body': 'Post de prueba'
    }
    """
    Given url "https://jsonplaceholder.typicode.com"
    And path "/posts"
    And request body
    When method post
    Then status 201
    * print response
    And match response.title == "Post de prueba"
    And match response.body == "Body de prueba"
    And match response.userId == 1

  Scenario: Caso 14 - Crear un post con docString en variable
    * def body =
    """
    {
      'userId': 1,
      'title': 'Post de prueba',
      'body': 'Post de prueba'
    }
    """
    Given url "https://jsonplaceholder.typicode.com"
    And path "/posts"
    And request body
    When method post
    Then status 201
    * print response
    And match response ==
    """
    {
      'id': #number,
      'userId': #number,
      'title': '#string',
      'body': '#string'
    }
    """
  Scenario: Caso 15 - Crear un post con JSON en variable
    * def body =
    """
    {
      'userId': 1,
      'title': 'Post de prueba',
      'body': 'Post de prueba'
    }
    """
    Given url "https://jsonplaceholder.typicode.com"
    And path "/posts"
    And request body
    When method post
    Then status 201
    * print response
    And match response == read( 'estructura-response.json')

