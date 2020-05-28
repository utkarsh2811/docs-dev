# Web and iOS Tracker Use Case

Following use case includes step-by-step creation of:

1. Source 
2. Custom Event Collection
3. Primary Identifier
4. Foreign Identifier
5. Custom Collection Data


## Source Creation

You can create either a web source or an iOS source by:

- Log-in into https://app.intempt.com
- After choosing org(here it is named as OrgABC), click on `Customer Data Platform` and under that, click on `Sources`
- Choose the source which you would like to work with, give it a name and hit save.

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

Once you have saved your source, and placed the respective JS Tracker or iOS Tracker to your webpage or iOS app respectively, we are ready to create our own custom collection. In this example, we shall create a custom collection named `Flight-Booking`. It will be of type [Event](https://dev.intempt.com/#collections).


## Primary Identifier Creation


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

Here we will create [Primary Identifier](https://dev.intempt.com/#add-identifier-to-a-collection) on newly created custom collection. It is a pre-requisite of posting any data to our custom collection.


## Foreign Identifier Creation


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

Now we add an Foreign Profile Identifier on the newly created custom collections. Attribute referenceId will point to the id of primary identifier. This process of creating Identifiers remains same for both iOS and Web Trackers.


## Custom Collection Data(Web Tracker)


```javascript
window._intempt['YOUR_TRACKER_NUMBER'].track("flight-booking", {"bookingId": "1", "flightId": "1", "bookingStatus": "booked", "bookingDate": "2020-05-25"})
```

> Example response:

```log
intempt.min.js:1 [Intempt] Flushing events queue 1
intempt.min.js:1 [Intempt] Successfully sent batch of event

```

You can now send data to your collection. A sample is shown. [Click here](https://github.com/intempt/intempt-intemptjs) for information on better understanding on usage of Intempt - JavaScript SDK.


## Custom Collection Data(iOS Tracker)


```swift
Intempt.track("flight-booking", withProperties: arrayData, error: nil)
   arrayData =      [
                {       
             "flightId" : "1",
            "bookingDate" : "2020-05-26",
            "bookingId": "2",
            "bookingStatus" : "booked"
        }
    ]
```

> Example response:

```text

responseDataFromServer------{
    "_embedded" =     {
        data =         (
                        {
                "_links" =                 {
                    collection =                     {
                        href = "https://api.staging.intempt.com/v1/orgabc/collections/98874260634599424";
                    };
                    self =                     {
                        href = "https://api.staging.intempt.com/v1/orgabc/collections/98874260634599424/data/98914882678554624";
                    };
                };
                collId = 98874260634599424;
                data =                 {
                    bookingDate = "2020-05-26";
                    bookingId = 2;
                    bookingStatus = booked;
                    eventId = b34c85e12ed643f4ae49953b34470c3d;
                    flightId = 1;
                    visitorId = 34fa4d294d8240dfbd82e3dfe1ba588c;
                };
                id = 98914882678554624;
                updated = 1590584152176;
            }
        );
    };
    "_links" =     {
        self =         {
            href = "https://api.staging.intempt.com/v1/orgabc/sources/98873253162778624/data";
        };
    };
}

```

You can now send data to your collection. A sample is shown. [Click here](https://github.com/intempt/intempt-ios-sdk) for further information on better understanding on usage of Intempt - iOS SDK.
