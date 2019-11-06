# Collection data

Collection data endpoint is used to work with data items in a collection.

Before storing data items, you will need to create a collection with a schema for this particular type of data.

## Get All Data in a Collection

```shell
curl "https://api.intempt.com/v1/your-org/collections/19554189106348032/data"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "_embedded": {
    "dataItemList": [
      {
        "collId": 19554189106348032,
        "id": 24665844119130112,
        "data": {
          "id": 2,
          "dateFrom": "2019-10-25",
          "dateTo": "2019-12-25",
          "guestId": 123123213,
          "roomId": 312312312
        },
        "matches": [],
        "_links": {
          "self": {
              "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data/24665844119130112"
          }
        }
      },
      {
        "collId": 19554189106348032,
        "id": 24663674875432960,
        "data": {
          "id": 4,
          "bookingDate": -1,
          "guestId": 2,
          "roomId": 10
        },
        "matches": [],
        "_links": {
          "self": {
              "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data/24663674875432960"
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/collections/19554189106348032/data"
    }
  }
}
```

This endpoint retrieves all data items for selected collection.

In current example, this call retrieves all room booking records.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/collections/19554189106348032/data`

### Success Response

This call will return an array of collection objects that contain `id`, `collId`, `data`, `matches` properties, alongside with child `_links` object.

`collId` property shows which collection this data item belongs to.

`data` is actual data payload.

In the `_links` object `self` points to the collection data item itself.

The root `_links` object's `self` property points to the list of data items.

## Get a Specific Data Item

```shell
curl "https://api.intempt.com/v1/your-org/collections/collection-id/data/data-item-id"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
    "collId": 19554189106348032,
    "id": 24663674875432960,
    "data": {
        "id": 4,
        "bookingDate": -1,
        "guestId": 2,
        "roomId": 10
    },
    "matches": [],
    "_links": {
        "self": {
            "href": "http://localhost:8081/v1/intempt-test/collections/19554189106348032/data/24663674875432960"
        }
    }
}
```

This endpoint retrieves a specific data item.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/collections/<ID>/data/<DATA-ITEM-ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the collection to retrieve data from
DATA-ITEM-ID | The ID of the data item to retrieve

### Success Response

This call will return an array of collection objects that contain `id`, `collId`, `data`, `matches` properties, alongside with child `_links` object.

`collId` property shows which collection this data item belongs to.

`data` is actual data payload.

In the `_links` object `self` points to the collection data item itself.

## Add a collection data item

```shell
curl "https://api.intempt.com/v1/your-org/collections/collection-id/data/data-item-id"
  -d '{
         "id": 4,
         "bookingDate": -1,
         "guestId": 2,
         "roomId": 10
       }'
  -X POST
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "collId": 19554189106348032,
  "id": 24663674875432960,
  "data": {
    "id": 4,
    "bookingDate": -1,
    "guestId": 2,
    "roomId": 10
  },
  "matches": [],
  "_links": {
    "self": {
        "href": "http://localhost:8081/v1/intempt-test/collections/19554189106348032/data/24663674875432960"
    }
  }
}
```

Use this command to add a new data item to a collection: 

- user visited a specific page
- a new flight booking was created
- new data received from POS terminal

The data object included in the request body has to match collection schema.

Fields that are not present in the collection schema will be ignored.

### HTTP Request

`POST https://api.intempt.com/v1/your-org/collections/<ID>/data/<DATA-ITEM-ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the collection to retrieve data from
DATA-ITEM-ID | The ID of the data item to retrieve

### Success Response

On successful call, saved data item object will be return in the response.


## Delete a Collection data item

```shell
curl "https://api.intempt.com/v1/your-org/collections/194123921/data/24663674875432960"
  -X DELETE
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

This endpoint deletes a specific collection data item.

### HTTP Request

`DELETE https://api.intempt.com/v1/your-org/collections/<ID>/data/<DATA-ITEM-ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the collection to delete data item from
DATA-ITEM-ID | The ID of the data item to delete

### Success Response

On successful delete, the deleted collection will be sent in the response.
