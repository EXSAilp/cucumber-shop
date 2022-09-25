Feature: Cut stocks
  As a Owner
  I want to cut stock.

  Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Milk" with price 49.00 and stock of 10 exists

  Scenario: Cut stock by one product
    When Customer buy "Bread" with quantity 2
    Then Remaining stock of "Bread" : 3

  Scenario: Cut stock by multiple products
    When Customer buy "Bread" with quantity 2
    And Customer buy "Jam" with quantity 1
    Then Remaining stock of "Bread" : 3
    Then Remaining stock of "Jam" : 9

  Scenario Outline: Cut stock by one product in table
    When Customer buy <product> with quantity <quantity>
    Then Remaining stock of <product> : <stock>
    Examples:
      | product  | quantity |  stock  |
      | "Bread"  |     1    |    4    |
      | "Jam"    |     2    |    8    |
      | "Milk"   |     1    |    9    |