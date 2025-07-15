#Author: Juan Camilo Alvarez Barrios


@ValidateApiTest
Feature: Validate Api reqres
  I Juan Camilo Alvarez
  As a certification analyst, I need to test the Reqres API.
  To find the majority of possible bugs

  Background:
    * url baseUrl
    * url baseUrlDos
    * configure headers = {'Content-type':'application/json'}
    * def pathListUser = 'users/'
    * def pathPOST = 'posts'
    * def pathPUT = 'posts/1'
    * def requestBodyPost = read('../json/bodyPost.json')
    * def requestBodyPostDos = read('../json/bodyPostDos.json')
    * def requestBodyPUt = read('../json/bodyPut.json')


  @ignore @TipoGET
  Scenario Outline: obtener nombre por ID <nombrecaso>
    Given path pathListUser + <ID>
    When method GET
    Then status 200
    And match response.data.id == <ID>
    And match response.data.email == '<email>'
    And match response.data.first_name == "#? _ == '<nombre>' || _ =='<nombreErrado>' "
    Examples:
      | nombrecaso | ID | email                  | nombre | nombreErrado |
      | casoUno    | 2  | janet.weaver@reqres.in | Janet  | Pedro        |

  @TipoPOST
  Scenario: Consumir API tipo POST
    Given path pathPOST
    When request requestBodyPost
    And method POST
    Then assert responseStatus == 201
    And match response.title == 'Charmander'
    And match response.body == 'Fire type Pokémon'
    And match response.userId == 1
    And match response.id == 101


  @TipoPOSTDos
  Scenario Outline: Consumir API tipo POST examples
    Given path pathPOST
    When request requestBodyPostDos
    And method POST
    Then assert responseStatus == 201
    And match response.title == '<title>'
    And match response.body == '<body>'
    And match response.id == 101
    Examples:
      | title     | body                | userId |
      | Bulbasaur | pokemon tipo planta | 2      |

  @TipoPUT
  Scenario Outline: Consumir API tipo PUT example
    Given path pathPUT
    When request requestBodyPUt
    And method PUT
    Then assert responseStatus == 200
    And match response.title == '<title>'
    And match response.body == '<body>'
    Examples:
      | id | title    | body                       | userId |
      | 1  | Squirtle | Water type Pokémon updated | 1      |