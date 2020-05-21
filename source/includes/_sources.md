# Sources

Intempt Source represents integration of Intempt with one of supported platforms (Shopify, HubSpot, Magento, POS system, etc.) or client's website/mobile app. You can find all the sources listed at `https://app.intempt.com` under `Customer Data Platform` -> `Sources`. Sources can be picked from below listed categories:

1. Intempt Web Tracker - for tracking all data flowing through your website.
2. iOS App - for tracking all data flowing through your iOS Application.
2. API Source - for creating collections, relations, identifiers etc. from scratch as they are created by default in other two sources for you. 

## Get All Sources

```shell
curl "https://api.intempt.com/v1/your-org/sources"
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
  "_embedded": {
    "sources": [
      {
        "id": 23525541210886144,
        "name": "tracker",
        "title": "Tracker",
        "description": "Automatically created tracker for organization's domain",
        "type": "js",
        "_links": {
          "self": {
            "href": "https://api.intempt.com/v1/your-org/sources/23525541210886144"
          },
          "collections": {
            "href": "https://api.intempt.com/v1/your-org/sources/23525541210886144/collections"
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/sources"
    },
    "byName": {
      "href": "https://api.intempt.com/v1/your-org/sources{?name}",
      "templated": true
    }
  }
}
```

This endpoint retrieves all sources for selected organization.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/sources`

### Success Response

This call will return an array of all Sources for specified organization. 

Each Source object contains `id`, `name`, `title`, `description`, `type` properties, alongside with child `_links` object. Link to `self` points to the source itself , while `collections` points to the list of all collections for this Source.

Root `_links` object also has `self` link, as well as `byName` link to fetch a specific Source by its `name` property.

## Get a Source

```shell
curl "https://api.intempt.com/v1/your-org/sources/source-id"
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
    "id": 23525541210886144,
    "name": "tracker",
    "title": "Tracker",
    "description": "Automatically created tracker for organization's domain",
    "type": "js",
    "_links": {
        "self": {
            "https://api.intempt.com/v1/your-org/sources/23525541210886144"
        },
        "collections": {
            "https://api.intempt.com/v1/your-org/sources/23525541210886144/collections"
        }
    }
}
```

This endpoint retrieves a specific Source.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/sources/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Source to retrieve

### Success Response

This call will return a Source object that contains `id`, `name`, `title`, `description`, `type` properties, alongside with `_links` object. Link to `self` points to the Source itself , while `collections` points to the list of all collections for this Source.

## Delete a Source

```shell
curl "https://api.intempt.com/v1/your-org/sources/194123921"
  -X DELETE
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```
> Example response:

```json
{
    "id": 23525541210886144,
    "name": "tracker",
    "title": "Tracker",
    "description": "Automatically created tracker for organization's domain",
    "type": "js",
    "_links": {
        "self": {
            "href": "https://api.intempt.com/v1/your-org/sources/23525541210886144"
        },
        "collections": {
            "href": "https://api.intempt.com/v1/your-org/sources/23525541210886144/collections"
        }
    }
}
```

This endpoint deletes a specific Source.

### HTTP Request

`DELETE https://api.intempt.com/v1/your-org/sources/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Source to delete

### Success Response

On successful delete, the deleted Source will be sent in the response.
