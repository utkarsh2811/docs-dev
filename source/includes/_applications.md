# Applications

Intempt Application represents integration of Intempt with one of supported platforms (Shopify, HubSpot, POS system, etc.) or client's website/mobile app.

## Get All Applications

```shell
curl "https://api.intempt.com/v1/your-org/applications"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
```

> Example response:

```json
{
  "_embedded": {
    "applications": [
      {
        "id": 23525541210886144,
        "name": "tracker",
        "title": "Tracker",
        "description": "Automatically created tracker for organization's domain",
        "type": "js",
        "_links": {
          "self": {
            "href": "https://api.intempt.com/v1/your-org/applications/23525541210886144"
          },
          "collections": {
            "href": "https://api.intempt.com/v1/your-org/applications/23525541210886144/collections"
          }
        }
      }
    ]
  },
  "_links": {
    "self": {
      "href": "https://api.intempt.com/v1/your-org/applications"
    },
    "byName": {
      "href": "https://api.intempt.com/v1/your-org/applications{?name}",
      "templated": true
    }
  }
}
```

This endpoint retrieves all applications for selected organization.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/applications`

### Success Response

This call will return an array of all Applications for specified organization. 

Each Application object contains `id`, `name`, `title`, `description`, `type` properties, alongside with child `_links` object. Link to `self` points to the application itself , while `collections` points to the list of all collections for this Application.

Root `_links` object also has `self` link, as well as `byName` link to fetch a specific Application by its `name` property.

## Get an Application

```shell
curl "https://api.intempt.com/v1/your-org/applications/application-id"
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
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
            "https://api.intempt.com/v1/your-org/applications/23525541210886144"
        },
        "collections": {
            "https://api.intempt.com/v1/your-org/applications/23525541210886144/collections"
        }
    }
}
```

This endpoint retrieves a specific Application.

### HTTP Request

`GET https://api.intempt.com/v1/your-org/applications/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Application to retrieve

### Success Response

This call will return an Application object that contains `id`, `name`, `title`, `description`, `type` properties, alongside with `_links` object. Link to `self` points to the Application itself , while `collections` points to the list of all collections for this Application.

## Delete an Application

```shell
curl "https://api.intempt.com/v1/your-org/applications/194123921"
  -X DELETE
  -H "Authorization: Bearer <YOUR_ACCESS_TOKEN>"
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
            "href": "https://api.intempt.com/v1/your-org/applications/23525541210886144"
        },
        "collections": {
            "href": "https://api.intempt.com/v1/your-org/applications/23525541210886144/collections"
        }
    }
}
```

This endpoint deletes a specific Application.

### HTTP Request

`DELETE https://api.intempt.com/v1/your-org/applications/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Application to delete

### Success Response

On successful delete, the deleted Application will be sent in the response.
