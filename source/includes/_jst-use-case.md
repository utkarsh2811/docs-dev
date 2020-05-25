# JS Tracker Use Case

Following use case includes step-by-step creation of:

1. Web Source
2. Custom Event Collection
3. Identifiers
4. data in custom collection


## Web Source Creation

You can create a web source by:

- Log-in into https://app.intempt.com
- After choosing org(here it is named as OrgABC), click on `Customer Data Platform` and under that, click on `Sources`
- Choose the source which you would like to work with, give it a name and hit save. In this example, we will work with Intempt Web Tracker.

## Custom Even Collection Creation


```shell
curl "https://api.intempt.com/v1/OrgABC/collections"
  -d '{
"sourceId": "98091578149437440",
"name": "flight-booking",
"profile": false,
"event": true,
"schema": {
"type": "record",
"name": "flight_booking_schema",
"namespace": "com.intempt.data.source.web",
"fields": [
{
"name": "eventId",
"type": "string"
},
{
"name": "visitorId",
"type": "string"
},
  {
"name": "bookingId",
"type": "string",
"display": true,
"title": "Booking ID"
},
{
"name": "flightId",
"type": "string",
"display": true,
"title": "Flight ID"
},
  {
"name": "bookingStatus",
"type": "string",
"display": true,
"title": "Booking Status"
},
  {
 "name": "bookingDate",
  "type": {
     "type": "string",
     "logicalType": "date"
          },
"display": true,
"title": "Booking Date"
}
]
}
}'
  -X POST
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
    "id": "98092788222918656",
    "sourceId": "98091578149437440",
    "sourceName": "mywebsource",
    "sourceTitle": "myWebSource",
    "name": "flight-booking",
    "profile": false,
    "event": true,
    "schema": {
        "type": "record",
        "name": "flight_booking_schema",
        "namespace": "com.intempt.data.source.web",
        "fields": [
            {
                "name": "eventId",
                "type": "string"
            },
            {
                "name": "visitorId",
                "type": "string"
            },
            {
                "name": "bookingId",
                "type": "string",
                "display": true,
                "title": "Booking ID"
            },
            {
                "name": "flightId",
                "type": "string",
                "display": true,
                "title": "Flight ID"
            },
            {
                "name": "bookingStatus",
                "type": "string",
                "display": true,
                "title": "Booking Status"
            },
            {
                "name": "bookingDate",
                "type": {
                    "type": "string",
                    "logicalType": "date"
                },
                "display": true,
                "title": "Booking Date"
            }
        ]
    },
    "_links": {
        "self": {
            "href": "https://api.intempt.com/v1/OrgABC/collections/98092788222918656"
        },
        "source": {
            "href": "https://api.intempt.com/v1/OrgABC/sources/98091578149437440"
        },
        "data": {
            "href": "https://api.intempt.com/v1/OrgABC/collections/98092788222918656/data"
        },
        "identifiers": {
            "href": "https://api.intempt.com/v1/OrgABC/collections/98092788222918656/identifiers"
        },
        "relations": {
            "href": "https://api.intempt.com/v1/OrgABC/relations?collId=98092788222918656"
        }
    }
}
```

Once you have saved your source, and placed the respective JS Tracker to your webpage, we are ready to create our own custom collection. In this example, we shall create a custom collection named `Flight-Booking`. It will be of type `Event`(refer to https://dev.intempt.com/#collections for understanding types of collections). We are ready to call the API for creating our custom collection.


## Identifiers

```shell
curl "https://api.intempt.com/v1/OrgABC/collections"
  -d '{
"collId": "98092788222918656",
"type": "primary",
"name": "profileId",
"schema": {
"type": "record",
"name": "profileId",
"namespace": "com.intempt.data.source.web",
"fields": [
  {
"name": "eventId",
"type": "string"
}
]
}
}'
  -X POST
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
    "collId": "98092788222918656",
    "id": "98124356064772096",
    "type": "primary",
    "name": "profileId",
    "schema": {
        "type": "record",
        "name": "profileId",
        "namespace": "com.intempt.data.source.web",
        "fields": [
            {
                "name": "eventId",
                "type": "string"
            }
        ]
    },
    "_links": {
        "self": {
            "href": "https://api.intempt.com/v1/OrgABC/identifiers/98124356064772096"
        }
    }
}
```

Here we will create Primary on newly created custom collection. It is a pre-requisite of posting any data to collection. For more information on Identifiers kindly refer to https://dev.intempt.com/#add-identifier-to-a-collection

```shell
curl "https://api.intempt.com/v1/OrgABC/collections"
  -d '{
"collId": "98092788222918656",
"type": "foreign",
"name": "foreignId",
"referenceId": 98109073040211968, 
"schema": {
"type": "record",
"name": "foreignId",
"namespace": "com.intempt.data.source.web",
"fields": [
  {
"name": "eventId",
"type": "string"
}
]
}
}'
  -X POST
  -H "Authorization: ApiKey <YOUR_API_KEY>"
```

> Example response:

```json
{
    "collId": "98092788222918656",
    "id": "98128081101651968",
    "type": "foreign",
    "name": "foreignId",
    "schema": {
        "type": "record",
        "name": "foreignId",
        "namespace": "com.intempt.data.source.web",
        "fields": [
            {
                "name": "eventId",
                "type": "string"
            }
        ]
    },
    "referenceId": 98124356064772096,
    "_links": {
        "self": {
            "href": "https://api.intempt.com/v1/OrgABC/identifiers/98128081101651968"
        }
    }
}
```
Now we add an Foreign Profile Identifier on the newly created custom collections. Attribute referenceId will point to the id of primary identifier.

## Custom Collection Data

```shell
window._intempt['YOUR_TRACKER_NUMBER'].track("flight-booking", {"bookingId": "1", "flightId": "1", "bookingStatus": "booked", "bookingDate": "2020-05-25"})
```

> Example response:

```
{
intempt.min.js:1 [Intempt] Flushing events queue 1
intempt.min.js:1 [Intempt] Successfully sent batch of event
}
```
You can add data to your collection by going to developer mode in Chrome and sending data to your custom collection via running this command in console panel.