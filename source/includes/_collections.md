# Collections

Collections define schemas for events or data of a certain type.

For example, collections can be created for:

- User profiles
- Flight & hotel bookings
- Certain user actions on a website

After creating a collection, use `collection data` endpoints to store and retrieve actual data items.

## Get All Collections

```shell
curl "https://api.intempt.com/v1/your-org/collections"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "_embedded": {
    "collections": [
      {
        "id": 19554189106348032,
        "appId": 347816547721216,
        "name": "booking",
        "profile": false,
        "event": false,
        "schema": {
          "type": "record",
          "name": "booking",
          "namespace": "customApplication",
          "fields": [
            {
              "name": "id",
              "type": "long",
              "identifier": {
                "primary": true
              }
            },
            {
              "name": "bookingDate",
              "type": "long",
              "default": -1
            },
            {
              "name": "guestId",
              "type": "long",
              "identifier": {
                "relation": {
                  "identifier": {
                    "name": "guestId",
                    "collection": "guest"
                  }
                }
              }
            },
            {
              "name": "roomId",
              "type": "long",
              "identifier": {
                "relation": {
                  "identifier": {
                    "name": "roomId",
                    "collection": "room"
                  }
                }
              }
            }
          ]
        },
        "_links": {
          "self": {
            "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032"
          },
          "data": {
            "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data"
          },
          "byName": {
            "href": "https://api.intempt.com/v1/your-org/collections?{name}",
            "templated": true
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/collections{?name}",
      "templated": true
    }
  }
}
```

This endpoint retrieves all collections for selected organization.

### HTTP Request

`https://api.intempt.com/v1/your-org/collections`

### Success Response

This call will return an array of collection objects that contain `id`, `appId`, `name`, `profile`, `event` and `schema` properties, alongside with child `_links` object.

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`appId` property shows to which Application this collection belongs.

`profile` property shows whether collection is a user profile.

`event` property shows whether collection is an event. Key difference of `event` type collection is that it has many-to-one relation with a profile. If `event` is true, having a relation with a profile collection is necessary.

In the `_links` object 
`self` points to the collection itself,
`data` points to the data in this collection,
`byName` points to a specific collection finding it by its `name`.

## Get a Specific Collection

```shell
curl "https://api.intempt.com/v1/your-org/collections/collection-id"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "id": 19554189106348032,
  "appId": 347816547721216,
  "name": "booking",
  "profile": false,
  "event": false,
  "schema": {
    "type": "record",
    "name": "booking",
    "namespace": "customApplication",
    "doc": "Booked room",
    "fields": [
      {
        "name": "id",
        "type": "long",
        "identifier": {
          "primary": true
        }
      },
      {
        "name": "dateFrom",
        "type": {
          "type": "string",
          "logicalType": "date"
        }
      },
      {
        "name": "dateTo",
        "type": {
          "type": "string",
          "logicalType": "date"
        }
      },
      {
        "name": "guestId",
        "type": "long",
        "identifier": {
          "relation": {
            "identifier": {
              "name": "guestId",
              "collection": "guest"
            }
          }
        }
      },
      {
        "name": "roomId",
        "type": "long",
        "identifier": {
          "relation": {
            "identifier": {
              "name": "roomId",
              "collection": "room"
            }
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032"
    },
    "data": {
      "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data"
    },
    "byName": {
      "href": "https://api.intempt.com/v1/your-org/collections?{name}",
      "templated": true
    }
  }
}
```

This endpoint retrieves a specific collection.

### HTTP Request

`https://api.intempt.com/v1/your-org/collections/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the collection to retrieve

### Success Response

This call will return a collection object that contains `id`, `appId`, `name`, `profile`, `event` and `schema` properties, alongside with the `_links` object. 

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`appId` property shows to which Application this collection belongs.

`profile` property shows whether collection is a user profile.

`event` property shows whether collection is an event. Key difference of `event` type collection is that it has many-to-one relation with a profile. If `event` is true, having a relation with a profile collection is necessary.

In the `_links` object 
`self` points to the collection itself,
`data` points to the data in this collection,
`byName` link points to a specific collection finding by its `name`.

## Create a collection

```shell
curl "https://api.intempt.com/v1/your-org/collections"
  -d 
  '{
    "appId": 347816547721216,
    "name": "booking",
    "schema": {
      "type": "record",
      "name": "booking",
      "namespace": "customApplication",
      "doc": "Booked room",
      "fields": [
        {
          "name": "id",
          "type": "long",
          "identifier": {
            "primary": true
          }
        },
        {
          "name": "dateFrom",
          "type": {
            "type": "string",
            "logicalType": "date"
          }
        },
        {
          "name": "dateTo",
          "type": {
            "type": "string",
            "logicalType": "date"
          }
        },
        {
          "name": "guestId",
          "type": "long",
          "identifier": {
            "relation": {
              "identifier": {
                "name": "guestId",
                "collection": "guest"
              }
            }
          }
        },
        {
          "name": "roomId",
          "type": "long",
          "identifier": {
            "relation": {
              "identifier": {
                "name": "roomId",
                "collection": "room"
              }
            }
          }
        }
      ]
    }'
  -X POST
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "id": 19554189106348032,
  "appId": 347816547721216,
  "name": "booking",
  "profile": false,
  "event": false,
  "schema": {
    "type": "record",
    "name": "booking",
    "namespace": "customApplication",
    "doc": "Booked room",
    "fields": [
      {
        "name": "id",
        "type": "long",
        "identifier": {
          "primary": true
        }
      },
      {
        "name": "dateFrom",
        "type": {
          "type": "string",
          "logicalType": "date"
        }
      },
      {
        "name": "dateTo",
        "type": {
          "type": "string",
          "logicalType": "date"
        }
      },
      {
        "name": "guestId",
        "type": "long",
        "identifier": {
          "relation": {
            "identifier": {
              "name": "guestId",
              "collection": "guest"
            }
          }
        }
      },
      {
        "name": "roomId",
        "type": "long",
        "identifier": {
          "relation": {
            "identifier": {
              "name": "roomId",
              "collection": "room"
            }
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032"
    },
    "data": {
      "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data"
    },
    "byName": {
      "href": "https://api.intempt.com/v1/your-org/collections?{name}",
      "templated": true
    }
  }
}
```

Use this endpoint to create a new collection.

In the ruqest body you will need to specify:

`appId` property, which shows to which Application this collection belongs.

`name` - collection name.

`schema` - defines the schema of this collection, all collection data items have to follow this schema.

`profile` - shows whether collection is a user profile.

`event` - shows whether collection is an event. Key difference of `event` type collection is that it has many-to-one relation with a profile. If `event` is true, having a relation with a profile collection is necessary.


### HTTP Request

`POST https://api.intempt.com/v1/your-org/collections`

### Success Response

If successful, this call will return a collection object that contains `id`, `appId`, `name`, `profile`, `event` and `schema` properties, alongside with the `_links` object. 

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`appId` property shows to which Application this collection belongs.

`profile` property shows whether collection is a user profile.

`event` property shows whether collection is an event. Key difference of `event` type collection is that it has many-to-one relation with a profile. If `event` is true, having a relation with a profile collection is necessary.

In the `_links` object 
`self` points to the collection itself,
`data` points to the data in this collection,
`byName` link points to a specific collection finding by its `name`.

## Delete a Collection

```shell
curl "https://api.intempt.com/v1/your-org/collections/194123921"
  -X DELETE
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

This endpoint deletes a specific collection.

### HTTP Request

`DELETE https://api.intempt.com/v1/your-org/collections/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the collection to delete

### Success Response

On successful delete, the deleted collection will be sent in the response.
