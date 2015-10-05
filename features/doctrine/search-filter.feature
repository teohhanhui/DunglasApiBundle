Feature: Search filter on collections
  In order to retrieve searched large collections of resources
  As a client software developer
  I need to retrieve collections by search query

  @createSchema @dropSchema
  Scenario: Get collection on an string property and on which search filter has been enabled in whitelist mode
    Given there is "30" dummy objects
    When I send a "GET" request to "/dummies?name=Dummy%20%233"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
        "@context": "/contexts/Dummy",
        "@id": "/dummies?name=Dummy%20%233",
        "@type": "hydra:PagedCollection",
        "hydra:totalItems": 2,
        "hydra:itemsPerPage": 3,
        "hydra:firstPage": "/dummies?name=Dummy%20%233",
        "hydra:lastPage": "/dummies?name=Dummy%20%233",
        "hydra:member": [
            {
                "@id": "/dummies/3",
                "@type": "Dummy",
                "name": "Dummy #3",
                "alias": "Alias #27",
                "dummyDate": null,
                "jsonData": [],
                "relatedDummy": null,
                "dummy": null,
                "relatedDummies": [],
                "name_converted": null
            },
            {
                "@id": "/dummies/30",
                "@type": "Dummy",
                "name": "Dummy #30",
                "alias": "Alias #0",
                "dummyDate": null,
                "jsonData": [],
                "relatedDummy": null,
                "dummy": null,
                "relatedDummies": [],
                "name_converted": null
            }
        ],
        "hydra:search": {
            "@type": "hydra:IriTemplate",
            "hydra:template": "/dummies{?id,name,relatedDummy.name,relatedDummies[],order[id],order[name],order[relatedDummy.symfony],dummyDate[before],dummyDate[after],relatedDummy.dummyDate[before],relatedDummy.dummyDate[after]}",
            "hydra:variableRepresentation": "BasicRepresentation",
            "hydra:mapping": [
                {
                    "@type": "IriTemplateMapping",
                    "variable": "id",
                    "property": "id",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "name",
                    "property": "name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.name",
                    "property": "relatedDummy.name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummies[]",
                    "property": "relatedDummies",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[id]",
                    "property": "id",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[name]",
                    "property": "name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[relatedDummy.symfony]",
                    "property": "relatedDummy.symfony",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "dummyDate[before]",
                    "property": "dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "dummyDate[after]",
                    "property": "dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.dummyDate[before]",
                    "property": "relatedDummy.dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.dummyDate[after]",
                    "property": "relatedDummy.dummyDate",
                    "required": false
                }
            ]
        }
    }
    """

  @createSchema @dropSchema
  Scenario: Get collection on an string property and on which search filter has not been enabled in whitelist mode
    Given there is "30" dummy objects
    When I send a "GET" request to "/dummies?foo=bar"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
        "@context": "/contexts/Dummy",
        "@id": "/dummies?foo=bar",
        "@type": "hydra:PagedCollection",
        "hydra:nextPage": "/dummies?foo=bar&page=2",
        "hydra:totalItems": 30,
        "hydra:itemsPerPage": 3,
        "hydra:firstPage": "/dummies?foo=bar",
        "hydra:lastPage": "/dummies?foo=bar&page=10",
        "hydra:member": [
            {
                "@id": "/dummies/1",
                "@type": "Dummy",
                "name": "Dummy #1",
                "alias": "Alias #29",
                "dummyDate": null,
                "jsonData": [],
                "relatedDummy": null,
                "dummy": null,
                "relatedDummies": [],
                "name_converted": null
            },
            {
                "@id": "/dummies/2",
                "@type": "Dummy",
                "name": "Dummy #2",
                "alias": "Alias #28",
                "dummyDate": null,
                "jsonData": [],
                "relatedDummy": null,
                "dummy": null,
                "relatedDummies": [],
                "name_converted": null
            },
            {
                "@id": "/dummies/3",
                "@type": "Dummy",
                "name": "Dummy #3",
                "alias": "Alias #27",
                "dummyDate": null,
                "jsonData": [],
                "relatedDummy": null,
                "dummy": null,
                "relatedDummies": [],
                "name_converted": null
            }
        ],
        "hydra:search": {
            "@type": "hydra:IriTemplate",
            "hydra:template": "/dummies{?id,name,relatedDummy.name,relatedDummies[],order[id],order[name],order[relatedDummy.symfony],dummyDate[before],dummyDate[after],relatedDummy.dummyDate[before],relatedDummy.dummyDate[after]}",
            "hydra:variableRepresentation": "BasicRepresentation",
            "hydra:mapping": [
                {
                    "@type": "IriTemplateMapping",
                    "variable": "id",
                    "property": "id",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "name",
                    "property": "name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.name",
                    "property": "relatedDummy.name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummies[]",
                    "property": "relatedDummies",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[id]",
                    "property": "id",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[name]",
                    "property": "name",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "order[relatedDummy.symfony]",
                    "property": "relatedDummy.symfony",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "dummyDate[before]",
                    "property": "dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "dummyDate[after]",
                    "property": "dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.dummyDate[before]",
                    "property": "relatedDummy.dummyDate",
                    "required": false
                },
                {
                    "@type": "IriTemplateMapping",
                    "variable": "relatedDummy.dummyDate[after]",
                    "property": "relatedDummy.dummyDate",
                    "required": false
                }
            ]
        }
    }
    """

  @createSchema @dropSchema
  Scenario: Get collection on an relation property and on which search filter has been enabled in whitelist mode
    Given there is "30" dummy objects with relatedDummy
    When I send a "GET" request to "/dummies?relatedDummy.name=RelatedDummy%20%231"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/Dummy",
      "@id": "/dummies?relatedDummy.name=RelatedDummy%20%231",
      "@type": "hydra:PagedCollection",
      "hydra:totalItems": 1,
      "hydra:itemsPerPage": 3,
      "hydra:firstPage": "/dummies?relatedDummy_name=RelatedDummy%20%231",
      "hydra:lastPage": "/dummies?relatedDummy_name=RelatedDummy%20%231",
      "hydra:member": [
          {
              "@id": "/dummies/1",
              "@type": "Dummy",
              "name": "Dummy #1",
              "alias": "Alias #29",
              "dummyDate": null,
              "jsonData": [],
              "relatedDummy": "/related_dummies/1",
              "dummy": null,
              "relatedDummies": [],
              "name_converted": null
          }
      ],
      "hydra:search": {
          "@type": "hydra:IriTemplate",
          "hydra:template": "/dummies{?id,name,relatedDummy.name,relatedDummies[],order[id],order[name],order[relatedDummy.symfony],dummyDate[before],dummyDate[after],relatedDummy.dummyDate[before],relatedDummy.dummyDate[after]}",
          "hydra:variableRepresentation": "BasicRepresentation",
          "hydra:mapping": [
              {
                  "@type": "IriTemplateMapping",
                  "variable": "id",
                  "property": "id",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "name",
                  "property": "name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.name",
                  "property": "relatedDummy.name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummies[]",
                  "property": "relatedDummies",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[id]",
                  "property": "id",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[name]",
                  "property": "name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[relatedDummy.symfony]",
                  "property": "relatedDummy.symfony",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "dummyDate[before]",
                  "property": "dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "dummyDate[after]",
                  "property": "dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.dummyDate[before]",
                  "property": "relatedDummy.dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.dummyDate[after]",
                  "property": "relatedDummy.dummyDate",
                  "required": false
              }
          ]
      }
    }
    """

  @createSchema @dropSchema
  Scenario: Get collection on an relation and on which search filter has been enabled in whitelist mode
    Given there is "30" dummy objects with relatedDummies
    When I send a "GET" request to "/dummies?relatedDummies[]=/related_dummies/1"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/Dummy",
      "@id": "/dummies?relatedDummies[]=/related_dummies/1",
      "@type": "hydra:PagedCollection",
      "hydra:totalItems": 1,
      "hydra:itemsPerPage": 3,
      "hydra:firstPage": "/dummies?relatedDummies%5B%5D=%2Frelated_dummies%2F1",
      "hydra:lastPage": "/dummies?relatedDummies%5B%5D=%2Frelated_dummies%2F1",
      "hydra:member": [
          {
              "@id": "/dummies/1",
              "@type": "Dummy",
              "name": "Dummy #1",
              "alias": "Alias #29",
              "dummyDate": null,
              "jsonData": [],
              "relatedDummy": null,
              "dummy": null,
              "relatedDummies": [
                  "/related_dummies/1"
              ],
              "name_converted": null
          }
      ],
      "hydra:search": {
          "@type": "hydra:IriTemplate",
          "hydra:template": "/dummies{?id,name,relatedDummy.name,relatedDummies[],order[id],order[name],order[relatedDummy.symfony],dummyDate[before],dummyDate[after],relatedDummy.dummyDate[before],relatedDummy.dummyDate[after]}",
          "hydra:variableRepresentation": "BasicRepresentation",
          "hydra:mapping": [
              {
                  "@type": "IriTemplateMapping",
                  "variable": "id",
                  "property": "id",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "name",
                  "property": "name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.name",
                  "property": "relatedDummy.name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummies[]",
                  "property": "relatedDummies",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[id]",
                  "property": "id",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[name]",
                  "property": "name",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "order[relatedDummy.symfony]",
                  "property": "relatedDummy.symfony",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "dummyDate[before]",
                  "property": "dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "dummyDate[after]",
                  "property": "dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.dummyDate[before]",
                  "property": "relatedDummy.dummyDate",
                  "required": false
              },
              {
                  "@type": "IriTemplateMapping",
                  "variable": "relatedDummy.dummyDate[after]",
                  "property": "relatedDummy.dummyDate",
                  "required": false
              }
          ]
      }
    }
    """
