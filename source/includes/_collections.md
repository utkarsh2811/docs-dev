# Collections

Collections describe schemas for events or data of a certain type, while collection data items represent cpecific pieces of data in that collection.

To put that in relational terms, collections are tables that describe columns (types,constraints, etc.), and collection data items are rows of values for those columns.

For example, collections can be created for:

- User profiles
- Flight & hotel bookings
- Certain user actions on a website

After creating a collection, use `collection data` endpoints to store and retrieve actual data items.

Intempt platform collection schemas should comply to [Apache Avro spec](https://avro.apache.org/docs/current/spec.html)

## Get All Collections

```shell
curl "https://api.intempt.com/v1/your-org/collections"
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
  "_embedded": {
    "collections": [
      {
        "id": 19554189106348032,
        "sourceId": 347816547721216,
        "name": "booking",
        "profile": false,
        "event": false,
        "schema": {
          "type": "record",
          "name": "booking",
          "namespace": "customSource",
          "fields": [
            {
              "name": "id",
              "type": "long"
            },
            {
              "name": "bookingDate",
              "type": "long",
              "default": -1
            },
            {
              "name": "guestId",
              "type": "long"
            },
            {
              "name": "roomId",
              "type": "long"
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

This call will return an array of collection objects that contain `id`, `sourceId`, `name`, `profile`, `event` and `schema` properties, alongside with child `_links` object.

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`sourceId` property shows to which Source this collection belongs.

`profile` property shows whether collection is a user profile collection. 

Profile collection primary `id` is used as a `profile id` across whole application. Profile collection requires also a `user id`, so we can link profile to a user. Only one profile collection is allowed per application.

`event` property shows whether collection is an event collection. Key difference of `event` type collection is that it has many-to-one relation with a profile.

Event collection is required to have `profile id`. Events not belonging to any profile are not supported.

In the `_links` object 
`self` points to the collection itself,
`data` points to the data in this collection,
`byName` points to a specific collection finding it by its `name`.

## Get a Specific Collection

```shell
curl "https://api.intempt.com/v1/your-org/collections/collection-id"
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
  "id": 19554189106348032,
  "sourceId": 347816547721216,
  "name": "booking",
  "profile": false,
  "event": false,
  "schema": {
    "type": "record",
    "name": "booking",
    "namespace": "customSource",
    "doc": "Booked room",
    "fields": [
      {
        "name": "id",
        "type": "long"
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
        "type": "long"
      },
      {
        "name": "roomId",
        "type": "long"
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

This call will return a collection object that contains `id`, `sourceId`, `name`, `profile`, `event` and `schema` properties, alongside with the `_links` object. 

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`sourceId` property shows to which Source this collection belongs.

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
    "sourceId": 347816547721216,
    "name": "booking",
    "schema": {
      "type": "record",
      "name": "booking",
      "namespace": "customSource",
      "doc": "Booked room",
      "fields": [
        {
          "name": "id",
          "type": "long"
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
          "type": "long"
        },
        {
          "name": "roomId",
          "type": "long"
        }
      ]
    }'
  -X POST
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
  "id": 19554189106348032,
  "sourceId": 347816547721216,
  "name": "booking",
  "profile": false,
  "event": false,
  "schema": {
    "type": "record",
    "name": "booking",
    "namespace": "customSource",
    "doc": "Booked room",
    "fields": [
      {
        "name": "id",
        "type": "long"
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
        "type": "long"
      },
      {
        "name": "roomId",
        "type": "long"
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

`sourceId` property, which shows to which Source this collection belongs.

`name` - collection name.

`schema` - defines the schema of this collection, all collection data items have to follow this schema.

`profile` - shows whether collection is a user profile.

`event` - shows whether collection is an event. Key difference of `event` type collection is that it has many-to-one relation with a profile. If `event` is true, having a relation with a profile collection is necessary.


### HTTP Request

`POST https://api.intempt.com/v1/your-org/collections`

### Success Response

If successful, this call will return a collection object that contains `id`, `sourceId`, `name`, `profile`, `event` and `schema` properties, alongside with the `_links` object. 

`schema` property defines the schema of this collection, all collection data items have to follow this schema.

`sourceId` property shows to which Source this collection belongs.

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
  -H "Authorization: ApiKey <YOUR_API_KEY>"
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
